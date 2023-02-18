import 'dart:isolate';
//Two way communication in isolate function 
void main(List<String> arguments) async{
ReceivePort receivePort=ReceivePort();
SendPort fooSendport;
receivePort.listen((message) {
  if(message is SendPort){
    fooSendport=message;
    fooSendport.send('hi foo i am main');
  }else{
  print(message);
  }
});
Isolate.spawn(foo,receivePort.sendPort);
}
void foo(SendPort sendPort){
  ReceivePort receivePort=ReceivePort();
  receivePort.listen((message) {
    print(message);
  });
  sendPort.send(receivePort.sendPort);
  for (var i = 0; i < 100; i++) {
    sendPort.send('hi main i am foo:$i');
  }
}










// one way communication in isolate function to other function.
// void main(List<String> arguments) async{
//   ReceivePort receivePort=ReceivePort();
//   receivePort.listen((message) {
//     print(message);
//   });
//   Isolate.spawn(foo, receivePort.sendPort);
// }

// void foo(SendPort sendPort){
//   for (var i = 0; i < 100; i++) {
//     sendPort.send('Hi ! Main , Im foo');
    
//   }
// }








// Parallelizam work in isolate and some time concurrency 
// void main(List<String> arguments) async{
//   Isolate.spawn(looping, 10);
//   Isolate.spawn(loopingTwo, 10);
//   print('pakistan');
//   await Future.delayed(const Duration(seconds: 10));

// }
// void looping(int maxValue){
//  for (var i = 0; i < maxValue; i++) {
//   for (var i = 0; i < 100; i++) {
//     print('looping :$i');
//      }
//    }
// }
// void loopingTwo(int maxValue){
//   for (var i = 0; i < maxValue; i++) {
//     for (var i = 0; i < 100; i++) {
//       print('loopingTwo :$i');
//     }
//      }
// }





// Concurrency work in asynchrous, this is the example of concurrency work in asynchrous. 
// void main(List<String> arguments) {
// foo(10);
// soo(10);
// }
// void foo(int maxValue)async{
//   for (var i = 0; i < maxValue; i++) {
//     print('the loop is :$i');
//     }
// }
// void soo(int maxValue)async{
//   for (var i = 0; i < maxValue; i++) {
//     print('the looping is :$i');
    
//   }
// }
