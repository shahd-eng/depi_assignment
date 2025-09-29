import 'package:depi_assignment/cubits/auth_cubit/auth_cubit.dart';
import 'package:depi_assignment/cubits/person_cubit/person_cubit.dart';
import 'package:depi_assignment/utils/app_colors.dart';
import 'package:depi_assignment/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PersonCubit>().loadPersons();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Popular Persons',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppColors.secondaryColor),),
      centerTitle:  true,
        actions: [
          IconButton(onPressed: (){
            context.read<AuthCubit>().signOut();
            Navigator.pushNamed(context,AppRoutes.welcome);
          }, icon: Icon(Icons.logout),color:AppColors.secondaryColor,)
        ],

      ),
      body: BlocBuilder<PersonCubit, PersonState>(
        builder: (context, state) {
          if (state is PersonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PersonLoaded) {
            final persons = state.person.results ?? [];
            return AnimationLimiter(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.7,
                ),
                itemCount: persons.length,
                itemBuilder: (context, index) {
                  
                  final person = persons[index];
                  final imageUrl = person.profilePath != null
                      ? "https://image.tmdb.org/t/p/w300${person.profilePath}"
                      : null;
              
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: Duration(seconds: 2),
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: imageUrl != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.network(
                                          imageUrl,
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                        ),
                                      )
                                    : const Icon(Icons.person, size: 80),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      person.name ?? "Unknown",
                                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(' Known for : ${person.knownForDepartment??""}',style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[700]),),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (state is PersonError) {
            return Center(child: Text("Error: ${state.message}"));
          } else {
            return const Center(child: Text("No data loaded yet"));
          }
        },
      ),
    );
  }
}
