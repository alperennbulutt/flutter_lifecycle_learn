import 'package:flutter/material.dart';
import 'package:flutter_lifecycle_learn/second_screen.dart';

class ScreenLifecyle extends StatefulWidget {
  late ScreenLifecyleState state;

  //createState(): Framework'e bir StatefulWidget oluşturma talimatı verildiğinde, hemen createState()'i çağırır.

  @override
  State<StatefulWidget> createState() {
    return ScreenLifecyleState();
  }
}

class ScreenLifecyleState extends State<ScreenLifecyle> {
  /*
 mount is true: createState durum sınıfınızı oluşturduğunda, bu duruma bir buildContext atanır.
    BuildContext, fazlasıyla basitleştirilmiş, "widget tree" bu parçacığın yerleştirildiği yerdir.
Tüm widget'ların bool this.mounted özelliği vardır.
    buildContext atandığında true olur. Bir parçacığın bağlantısı kaldırıldığında setState'i çağırmak bir hatadır.
    mount is false: Durum nesnesi asla yeniden monte edilemez ve setState çağrıldığında bir hata verilir.
    */

  /*
 Bu, widget oluşturulduğunda çağrılan ilk yöntemdir (elbette sınıf kurucusundan sonra).
    initState yalnızca bir kez çağrılır. super.initState() olarak adlandırılmalıdır.
    */
  @override
  void initState() {
    super.initState();
    print("initState");
  }

  /*
    
Bu yöntem, pencere öğesi ilk kez oluşturulduğunda initState'den hemen sonra çağrılır.
    */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  /*
    build(): Bu metot sıklıkla çağrılır. Gereklidir ve bir Widget döndürmesi gerekir.
    */
  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_circle_right_outlined),
          onPressed: (() => Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const SecondScreen())))),
        ));
  }

  /*
    Ana widget değişirse ve bu pencere öğesini yeniden oluşturması gerekiyorsa ( ona farklı veriler vermesi gerekir),
    ancak aynı runtimeType ile yeniden oluşturulduktan sonra bu yöntem çağrılır.
    Bunun nedeni Flutter'ın uzun ömürlü olan durumu yeniden kullanmasıdır.
    Bu durumda, initState'de yaptığınız gibi bazı verileri yeniden başlatmak isteyebiliriz.
    */
  @override
  void didUpdateWidget(ScreenLifecyle oldWidget) {
    print("didUpdateWidget");

    super.didUpdateWidget(oldWidget);
  }

  @override
  void setState(fn) {
    print("setState");

    super.setState(fn);
  }

  /*
    State ağaçtan kaldırıldığında deactivate çağrılır,
    ancak mevcut state değişikliği bitmeden yeniden yerleştirilebilir.
    Bu yöntem temel olarak, State nesnelerinin bir ağaçtaki bir noktadan diğerine taşınabilmesi nedeniyle mevcuttur.
    */
  @override
  void deactivate() {
    print("deactivate");
    super.deactivate();
  }

  /*
    Dispose, kalıcı olan State nesnesi kaldırıldığında çağrılır.
    Bu yöntem, tüm animasyonları, akışları vb. iptal etmeniz gereken yerdir.
    */
  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeDependencies();
    switch (state) {
      case AppLifecycleState.inactive:
        print('appLifeCycleState inactive');
        break;
      case AppLifecycleState.resumed:
        print('appLifeCycleState resumed');
        break;
      case AppLifecycleState.paused:
        print('appLifeCycleState paused');
        break;
      case AppLifecycleState.detached:
        print('appLifeCycleState detached');
        break;
    }
  }
}
