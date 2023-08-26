import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/auth_service.dart';
import '../controllers/register_controller.dart';

//kayıt olma sayfası
class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login-background.jpg'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
              child: const Text(
                "Create\nAccount",
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    right: 35,
                    left: 35,
                    top: MediaQuery.of(context).size.height * 0.27),
                child: Column(children: [
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintText: 'Name',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.amber,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextField(
                    style: TextStyle(color: Colors.black),
                    controller: controller.pwController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.black),
                      ),
                      hintText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        //kayıt ol tuşu
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xff4c505b),
                          child: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              AuthService.register(
                                  controller.emailController.text,
                                  controller.pwController.text,
                                  controller.nameController.text);
                              Get.toNamed("login");
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ]),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.toNamed("/login");
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ]),
                ]),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
