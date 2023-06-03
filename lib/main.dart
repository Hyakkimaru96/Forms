import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThreadPage()),
                  );
                },
                child: Text('Thread'),
              ),
            ),
            SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JobPostPage()),
                  );
                },
                child: Text('Job Post'),
              ),
            ),
            SizedBox(height: 16),
            Flexible(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StartupPageState()),
                  );
                },
                child: Text('Startup'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThreadPage extends StatefulWidget {
  ThreadPage({Key? key}) : super(key: key);

  @override
  _ThreadPageState createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _contentController = TextEditingController();
  final _tagsController = TextEditingController();
  final _commentsController = TextEditingController();
  final _contentCoverUrlController = TextEditingController();
  List<String> _tags = [];

  @override
  void dispose() {
    _titleController.dispose();
    _authorController.dispose();
    _imageUrlController.dispose();
    _contentController.dispose();
    _tagsController.dispose();
    _commentsController.dispose();
    _contentCoverUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Thread Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter content';
                  }
                  return null;
                },
              ),
SizedBox(height: _tags.isEmpty ? 0 : 0),
Stack(
  children: [
    Container(
      height: _tags.isNotEmpty ? 50 : null,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            controller: _tagsController,
            decoration: InputDecoration(labelText: 'Tags'),
            onChanged: (value) {
              if (value.isNotEmpty && value.endsWith(' ')) {
                setState(() {
                  String tag = value.trim();
                  if (!_tags.contains(tag)) {
                    _tags.add(tag);
                  }
                  _tagsController.clear();
                });
              }
            },
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _tags
                  .where((tag) => tag.isNotEmpty) // Filter out empty tags
                  .map((tag) {
                    return Container(
                      child: Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        ),
      ],
    ),
  ],
),







              TextFormField(
                controller: _commentsController,
                decoration: InputDecoration(labelText: 'Comments'),
                maxLines: null,
              ),
              TextFormField(
                controller: _contentCoverUrlController,
                decoration: InputDecoration(labelText: 'Content Cover URL'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    String title = _titleController.text;
                    String author = _authorController.text;
                    String imageUrl = _imageUrlController.text;
                    String content = _contentController.text;
                    List<String> tags = _tags;
                    String comments = _commentsController.text;
                    String contentCoverUrl = _contentCoverUrlController.text;

                    // Print form data
                    print('Title: $title');
                    print('Author: $author');
                    print('Image URL: $imageUrl');
                    print('Content: $content');
                    print('Tags: $tags');
                    print('Comments: $comments');
                    print('Content Cover URL: $contentCoverUrl');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class JobPostPage extends StatefulWidget {
  JobPostPage({Key? key}) : super(key: key);

  @override
  _JobPostPageState createState() => _JobPostPageState();
}

class _JobPostPageState extends State<JobPostPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _companyController = TextEditingController();
  final _locationController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _tagsController = TextEditingController();
  List<String> _tags = [];

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _descriptionController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Job Post Page')),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _companyController,
                decoration: InputDecoration(labelText: 'Company'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a company';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _locationController,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
             SizedBox(height: _tags.isEmpty ? 0 : 0),

SizedBox(height: _tags.isEmpty ? 0 : 0),
Stack(
  children: [
    Container(
      height: _tags.isNotEmpty ? 50 : null,
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: TextFormField(
            controller: _tagsController,
            decoration: InputDecoration(labelText: 'Tags'),
            onChanged: (value) {
              if (value.isNotEmpty && value.endsWith(' ')) {
                setState(() {
                  String tag = value.trim();
                  if (!_tags.contains(tag)) {
                    _tags.add(tag);
                  }
                  _tagsController.clear();
                });
              }
            },
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _tags
                  .where((tag) => tag.isNotEmpty) // Filter out empty tags
                  .map((tag) {
                    return Container(
                      child: Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      ),
                    );
                  })
                  .toList(),
            ),
          ),
        ),
      ],
    ),
  ],
),
            
                ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    String title = _titleController.text;
                    String company = _companyController.text;
                    String location = _locationController.text;
                    String description = _descriptionController.text;
                    List<String> tags = _tags;

                    // Print form data
                    print('Title: $title');
                    print('Author: $company');
                    print('Image URL: $location');
                    print('Content: $description');
                    print('Tags: $tags');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StartupPageState extends StatefulWidget {
  StartupPageState({Key? key}) : super(key: key);

  @override
  _StartupPageStateState createState() => _StartupPageStateState();
}

class _StartupPageStateState extends State<StartupPageState> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _founderController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _valueController = TextEditingController();
  List<String> _tags = [];

  @override
  void dispose() {
    _nameController.dispose();
    _founderController.dispose();
    _descriptionController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, 
        title: Text('Startup Page')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _founderController,
                decoration: InputDecoration(labelText: 'Founder'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a founder';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              Wrap(
  spacing: 8.0,
  runSpacing: 4.0,
  children: _tags.map((tag) {
    return Chip(
      label: Text(tag),
      onDeleted: () {
        setState(() {
          _tags.remove(tag);
        });
      },
    );
  }).toList(),
)

,
              TextFormField(
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Company Value'),
                onFieldSubmitted: (value) {
                  setState(() {
                    _tags.add(value);
                    _valueController.text = '';
                  });
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Process form data
                    String name = _nameController.text;
                    String founder = _founderController.text;
                    String description = _descriptionController.text;
                    String value = _valueController.text;

                    // Print form data
                    print('Name: $name');
                    print('Founder: $founder');
                    print('Description: $description');
                    print('Company Value: $value');
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }



  List<List<String>> _parseCompanyStats(String stats) {
    // Split the stats string into lines
    List<String> lines = stats.split('\n');

    // Split each line by commas to get the stat values
    List<List<String>> parsedStats = lines.map((line) => line.split(',')).toList();

    return parsedStats;
  }

  List<String> _parseCarouselList(String carouselList) {
    // Split the carouselList string by commas to get the image URLs
    List<String> parsedCarouselList = carouselList.split(',');

    return parsedCarouselList;
  }
}


class ThreadObj {
  final String title;
  final String author;
  final String imageUrl;
  final String content;
  final List<String> tags;
  final List<List<String>> comments;
  final String contentCoverUrl;

  ThreadObj({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.content,
    required this.tags,
    required this.comments,
    required this.contentCoverUrl,
  });

  factory ThreadObj.fromJSON(Map<String, dynamic> json) {
    return ThreadObj(
      title: json['title'],
      author: json['author'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      comments: List<List<String>>.from(json['comments']
          .map((comment) => List<String>.from(comment))),
      contentCoverUrl: json['contentCoverUrl'],
    );
  }
}

class JobPostObj {
  final String title;
  final String author;
  final String companyName;
  final String imageUrl;
  final String content;
  final List<String> tags;
  final List<List<String>> comments;
  final String contentCoverUrl;

  JobPostObj({
    required this.title,
    required this.author,
    required this.companyName,
    required this.imageUrl,
    required this.content,
    required this.tags,
    required this.comments,
    required this.contentCoverUrl,
  });

  factory JobPostObj.fromJSON(Map<String, dynamic> json) {
    return JobPostObj(
      title: json['title'],
      author: json['author'],
      companyName: json['companyName'],
      imageUrl: json['imageUrl'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      comments: List<List<String>>.from(json['comments']
          .map((comment) => List<String>.from(comment))),
      contentCoverUrl: json['contentCoverUrl'],
    );
  }
}
class StartupPage {
  final String companyName;
  final String companyDescription;
  final List<List<String>> companyStats;
  final List<String> carouselList;
  final String companyIconUrl;
  final String companyValue;

  StartupPage({
    required this.companyName,
    required this.companyDescription,
    required this.companyStats,
    required this.carouselList,
    required this.companyIconUrl,
    required this.companyValue,
  });

  factory StartupPage.fromJSON(Map<String, dynamic> json) {
    return StartupPage(
      companyName: json['companyName'],
      companyDescription: json['companyDescription'],
      companyStats: List<List<String>>.from(json['companyStats']
          .map((stat) => List<String>.from(stat))),
      carouselList: List<String>.from(json['carouselList']),
      companyIconUrl: json['companyIconUrl'],
      companyValue: json['companyValue'],
    );
  }
} 
