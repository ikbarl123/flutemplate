part of 'scr.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
   int currentStep = 0;
  final List<GlobalKey<FormState>> _formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(), GlobalKey<FormState>()];
  final nama = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final umur = TextEditingController();
  @override
  
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        steps: steps(),
        currentStep: currentStep,
        onStepContinue: (){
          final isLastStep = currentStep == steps().length - 1;
          if (isLastStep){
             // _formKeys[currentStep].currentState.save();
          } else 
          if (_formKeys[currentStep].currentState!.validate()) {
                      
          setState(() {
            currentStep = currentStep + 1;
          });
                }

        },
        onStepCancel: (){
         currentStep == 0 ? null : setState(() {
            currentStep = currentStep - 1;
          });
        },
        ),
    );
    
  }
  List<Step> steps() => [
     Step(
      title: const Text('Step 1'),
      content: Form(
        key: _formKeys[0],
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nama,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ],
          ),
        ),
      ),
      isActive: currentStep >= 0,
    ),
    Step(
      title: const Text('Step 2'),
      content: Form(
        key: _formKeys[1],
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: email,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Enter your password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ],
          ),
        ),
      ),
      isActive: currentStep >= 1,
    ),
     Step(
      title: const Text('Step 3'),
      content: Form(
        key: _formKeys[2],
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: umur,
                decoration: const InputDecoration(
                  labelText: 'Enter your name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              ],
          ),
        ),
      ),
      isActive: currentStep >= 2,
    ),
    Step(
      title: const Text('Result'),
      content: Padding(
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Nama : ${nama.text}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Email : ${email.text}',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Umur : ${umur.text} Tahun',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
              
              ],
          ),
        ),
      ),
      isActive: currentStep >= 3,
    ),
  ];
}