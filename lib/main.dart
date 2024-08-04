import 'package:flutter/material.dart';
import 'user.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowMaterialGrid: false,
        title: 'Flutter Demo SARAH',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
bool isSec = true;

Map<String, User> users ={
  'sarasadik"gmail.com': User(email: 'sarasadik"gmail.com', password: '12345'),
  'saramamdouh"gmail.com': User(email: 'saramamdouh"gmail.com', password: '123456789'),
};

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(73, 120, 7, 131),
        centerTitle: true,
        title: const Text(
          "LOGIN PAGE",
          style: TextStyle(fontSize: 29, color: Colors.white),
        ),
        leading: const Icon(Icons.menu, color: Colors.white, size: 30),
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
            size: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.message,
            color: Colors.white,
            size: 25,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
            children:[
              Image.asset('assets/pic.png',
              width: 350,
              height: 350,
              ),
        
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children:[
                        TextFormField(
                          controller: emailcontroller,
                          decoration: InputDecoration(
                            label: Text('Enter Email'),
                            prefixIcon: Icon(Icons.person, color: Colors.grey),
                            border: OutlineInputBorder(
                             borderSide: BorderSide(),
                            ),
                            
                          ),
                        ),
        
                        SizedBox(height: 40),
                        TextFormField(
                          controller:passwordcontroller ,
                          obscureText: isSec,
                          decoration: InputDecoration(
                            label: Text('Enter Password'),
                            prefixIcon: Icon(Icons.lock, color: Colors.grey),
                            suffixIcon: IconButton(onPressed: (){
                              setState(() {
                                isSec = !isSec;
                              });
        
                            },icon: Icon(Icons.remove_red_eye)),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(),
                            ),
                          ),
                        ),
        
                        SizedBox(height: 40),
                        InkWell(
                          onTap: () {
                            
                             User user = users[emailcontroller.text]!;
                              
        
                              if(user.email == emailcontroller.text && user.password == passwordcontroller){
                                print('logged');
                              }else{
                                print('email or password wrong');
                              }
        
                            
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(borderRadius:BorderRadius.circular(15),color: Colors.purple),
                            width: 300,
                            height: 90,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center ,
                              children: [
                              Text('Login', style: TextStyle(color: Colors.white, fontSize: 30),),
                              SizedBox(width: 9),
                              Icon(Icons.login, color: Colors.white),
                            ],
                            ),
                          ),
                        ),
                      ],
                  ),
              ),
        
        
            ],
        ),
      )
    );
  }
}