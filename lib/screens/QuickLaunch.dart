import 'package:flutter/material.dart';

class QuickLaunch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, null),
        ),
        title: Text('Quick Launch'),
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Popular Websites in Pakistan',
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/google.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.google.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/facebook.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://m.facebook.com',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/twitter.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.twitter.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/youtube.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.youtube.com',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/hamariweb.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.hamariweb.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/rozee.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.rozee.pk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/urdupoint.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.urdupoint.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/daraz.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.daraz.pk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/mustakbil.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.mustakbil.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/nadra.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.nadra.gov.pk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/dawn.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.dawn.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/tribune.jpg'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.tribune.com.pk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/jang.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.jang.com.pk',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/whatmobile.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://whatmobile.com.pk',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/cocashcreators.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.cocashcreators.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/pakwired.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.pakwired.com',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/ilmkiduniya.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.ilmkiduniya.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/olx.png'),
                    onPressed: () => Navigator.pop(
                      context,
                      'https://www.olx.com.pk',
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/pakwheels.jpg'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.pakwheels.com',
                    ),
                  ),
                  FlatButton(
                    child: Image.asset('assets/quicklaunch/zameen.jpg'),
                    onPressed: () => Navigator.pop(
                      context,
                      'http://www.zameen.com',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
