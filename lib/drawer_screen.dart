import 'package:flutter/material.dart';
import 'package:nannyvanny/theme/custom_theme.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36.0,vertical: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: CustomTheme.primary)),
              child: Image.asset(
                "assets/images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Emily Cyrus",
              style: TextStyle(
                  color: CustomTheme.primary,
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Home",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("Book A Nanny",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("How It Works",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("Why Nanny Vanny",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("My Bookings",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("My Profile",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  height: 1,
                  color: CustomTheme.primary,
                ),
                const SizedBox(height: 10,),
                const Text("Support",style: TextStyle(color: CustomTheme.secondary,fontSize: 18,fontWeight: FontWeight.w900),
                ),
                
              
              ],
            )
          ],
        ),
      ),
    );
  }
}
