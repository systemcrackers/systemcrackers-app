class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
        "Does your child look at you when you call his/her name?",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "How easy is it for you to get eye contact with your child?",
    "options":['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "Does your child point to indicate that s/he wants something? (e.g. a toy is out of reach)",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "Does your child point to share interest with you? (e.g. pointing at an interesting sight)",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Does your child pretend? (e.g. care for dolls, talk on a toy phone)",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Does your child follow where you're looking?",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 7,
    "question": "If you or someone else in the family is visibly upset, does your child show signs of wanting to comfort them? (e.g. stroking hair, hugging them)",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "Would you describe your child's first word as:",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 9,
    "question": "Does your child you simple gestures? (e.g. wave goodbye)",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  },
  {
    "id": 10,
    "question": "Does your child stare at nothing with no apperent purpose",
    "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
    "answer_index": 2,
  }
];

// const List sample_data2 = [
//   {
//     "id": 1,
//     "question":
//     "Feeling nervous, anxious or on edge?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 1,
//   },
//   {
//     "id": 2,
//     "question": "Feeling down, depressed or hopeless",
//     "options":['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },
//   {
//     "id": 3,
//     "question": "Worrying too much about different things?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },
//   {
//     "id": 4,
//     "question": "Trouble relaxing?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },
//   {
//     "id": 5,
//     "question": "Being so restless that it is hard to sit still?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },
//   {
//     "id": 6,
//     "question": "Becoming easily annoyed or irritable?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },
//   {
//     "id": 7,
//     "question": "Feeling afraid as if something awful might happen?",
//     "options": ['Not at all', 'Several Days', 'More than half the days', 'Nearly everyday'],
//     "answer_index": 2,
//   },

// ];
