import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  String message;
  Function onRefreshTap;
  ErrorView({super.key, required this.message, required this.onRefreshTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Container(

                    alignment: Alignment.topLeft,
                    child: Text(
                      message,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
               // margin: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                  onPressed:  () {
                    onRefreshTap;
                  },
                  child: const Text('Refresh',maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
