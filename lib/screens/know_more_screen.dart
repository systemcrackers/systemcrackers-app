import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class Feature {
  final int id;
  final String title;
  final String description;
  final String urlImage;
  // final String ageGroup;
  final String nextScreenRoute;

  const Feature({
    required this.id,
    required this.title,
    required this.description,
    required this.urlImage,
    // required this.ageGroup,
    required this.nextScreenRoute,
  });
}

class KnowMoreScreen extends StatelessWidget {
  KnowMoreScreen({super.key});

  List<Feature> featuresList = [
    const Feature(
      id: 0,
      title: 'What is a Learning Disability?',
      description:
          'A learning disability is a neurological condition which affects the brain\'s ability to send, receive, and process information. A child with a learning disability may have difficulties in reading, writing, speaking, listening, understanding mathematical concepts, and with general comprehension. Learning disabilities include a group of disorders such as dyslexia, dyspraxia, dyscalculia and dysgraphia. Each type of disorder may coexist with another.\nThe term includes such conditions as perceptual handicaps, brain injury, minimal brain dysfunction, dyslexia and developmental aphasia.\nThe term does not include children who have learning problems which are primarily the result of visual, hearing or motor handicaps, or mental retardation, emotional disturbance or environmental, cultural or economic disadvantages.',
      urlImage: 'assets/icons/learning_disabilities.jpg',
      // ageGroup: 'Time Management',
      nextScreenRoute: '/learning_disability',
    ),
    const Feature(
      id: 1,
      title: 'How is a learning disability identified?',
      description:
          'Identifying a learning disability is a complex process. The first step is to rule out vision, hearing, and developmental issues that can overshadow the underlying learning disability. Once these tests are completed, a learning disability is identified using psycho educational assessment, which includes academic achievement testing along with a measure of intellectual capability. This test helps determine if there is any significant discrepancy between a child\'s potential and performance capability (IQ) and the child\'s academic achievement (school performance).',
      urlImage: 'assets/icons/identify.jpg',
      // ageGroup: 'Time Management',
      nextScreenRoute: '/identify_learning_disability',
    ),
    const Feature(
      id: 2,
      title:
          'What are the intervention and support options for learning disabilities?',
      description:
          'A learning disability cannot be cured. However with timely intervention and support, children with learning disabilities can be successful in school. Parents and teachers are the first persons to notice that the child is finding it difficult to read, write or learn. If you think that your child may have a learning disability, seek help from a mental health expert or other trained specialists for the required intervention program or therapy.',
      urlImage: 'assets/icons/support.jpg',
      nextScreenRoute: '/support_learning_disability',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Know More',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Icon(Icons.person),
          SizedBox(width: MediaQuery.of(context).size.width * 0.05),
        ],
      ),
      body: Column(children: [
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: featuresList.length,
            itemBuilder: (context, index) {
              final feature = featuresList[index];

              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 15, 20, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 10,
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15)),
                              child: Image.asset(
                                feature.urlImage,
                                fit: BoxFit.cover,
                                height: 100,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 0.0, 20.0, 0.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  feature.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                ExpandableText(
                                  feature.description,
                                  expandText: "show more",
                                  collapseText: "show less",
                                  expandOnTextTap: true,
                                  collapseOnTextTap: true,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.0,
                                  ),
                                  maxLines: 2,
                                  // overflow: TextOverflow.visible,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })
      ]),
    );
  }
}
