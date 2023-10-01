import 'package:flutter/material.dart';
import 'package:mynewproject/Assets/cart_items.dart';
import 'package:mynewproject/Assets/colors.dart';
import 'package:mynewproject/custom%20widgets/custom_button.dart';
import 'package:mynewproject/screens/add_new_card_view.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // Define a variable to track the selected address.
  String selectedAddress = 'Home';

  // Define variables to store the addresses (you can replace these with actual data).
  String homeAddress = "36 Green Way, Karachi Pakistan";
  String officeAddress = "Medical road, Halal lab, Sunamganj";

  // Function to handle address selection.
  void selectAddress(String address) {
    setState(() {
      selectedAddress = address;
    });
  }

  // Function to handle editing the address.
  void editAddress(String addressType) async {
    String? updatedAddress = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        String currentAddress =
            addressType == 'Home' ? homeAddress : officeAddress;
        String updatedAddress = currentAddress;

        return AlertDialog(
          title: Text("Edit $addressType Address"),
          content: TextField(
            onChanged: (value) {
              updatedAddress = value;
            },
            decoration: InputDecoration(labelText: "New Address"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving.
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  if (addressType == 'Home') {
                    homeAddress = updatedAddress;
                  } else if (addressType == 'Office') {
                    officeAddress = updatedAddress;
                  }
                });
                Navigator.of(context).pop(
                    updatedAddress); // Close the dialog and return the updated address.
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );

    if (updatedAddress != null) {
      // Update the selected address.
      selectAddress(addressType);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // ---------------------App bar start-----------------------------------
        appBar: AppBar(
          shadowColor: MyColors.black10,
          backgroundColor: MyColors.black1,
          iconTheme: IconThemeData(
            color: MyColors.black100, // Change this color to your desired color
          ),
          title: Text(
            "Product cart (${cartItems.length})",
            style: TextStyle(color: MyColors.black100),
          ),
        ),
        // ---------------------App bar END-----------------------------------

        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivery Address",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    // ---------------------------Home address START ------------------------------------------
                    GestureDetector(
                      onTap: () => selectAddress('Home'),
                      child: Container(
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: selectedAddress == 'Home'
                                ? MyColors.yellowD
                                : Colors
                                    .transparent, // Change border color conditionally
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                if (selectedAddress == 'Home')
                                  Icon(
                                    Icons.check_circle,
                                    color: MyColors.yellowD,
                                  )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  homeAddress,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Show the address editing dialog for Home address.
                                    editAddress('Home');
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: MyColors.blueD),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // ---------------------------Home address END ------------------------------------------
                    SizedBox(
                      height: 10,
                    ),
                    // ----------------------------Office address START ----------------------------------------
                    GestureDetector(
                      onTap: () => selectAddress('Office'),
                      child: Container(
                        height: 96,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color: selectedAddress == 'Office'
                                ? MyColors.yellowD
                                : Colors
                                    .transparent, // Change border color conditionally
                          ),
                        ),
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Office",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                if (selectedAddress == 'Office')
                                  Icon(
                                    Icons.check_circle,
                                    color: MyColors.yellowD,
                                  )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  officeAddress,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Show the address editing dialog for Office address.
                                    editAddress('Office');
                                  },
                                  child: Text(
                                    "Edit",
                                    style: TextStyle(color: MyColors.blueD),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // ----------------------------Office address START ----------------------------------------
                  ],
                ),
              ),
              // ------------------------------------Add card Button Start-------------------------------
              Container(
                alignment: AlignmentDirectional.center,
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return AddNewCard();
                      },
                    ));
                  },
                  buttonBackground: MyColors.blueL,
                  borderRadius: BorderRadius.circular(20),
                  width: double.infinity,
                  height: 56,
                  textWidget: Text(
                    "Add Card",
                    style: TextStyle(
                      color: MyColors.black1,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
