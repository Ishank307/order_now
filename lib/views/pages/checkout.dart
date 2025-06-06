import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as badges;
import 'package:order_now/views/components/custom_botton.dart';

class CheckoutPage extends StatefulWidget {
  final List<Map<String, dynamic>> cartItems;
  final double totalAmount;

  const CheckoutPage({
    super.key,
    required this.cartItems,
    required this.totalAmount,
  });

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();

  // Form controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  // State variables
  String _selectedPaymentMethod = 'Cash on Delivery';
  String _selectedDeliveryTime = 'ASAP (30-45 mins)';
  bool _isProcessing = false;

  final List<String> _paymentMethods = [
    'Cash on Delivery',
    'Online Payment',
    'UPI Payment',
    'Card Payment',
  ];

  final List<String> _deliveryTimes = [
    'ASAP (30-45 mins)',
    'Schedule for later',
    '1-2 hours',
    '2-3 hours',
  ];

  double get deliveryFee => 30.0;
  double get taxAmount => widget.totalAmount * 0.05;
  double get finalTotal => widget.totalAmount + deliveryFee + taxAmount;

  void _processOrder() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isProcessing = true;
      });

      // Simulate order processing
      await Future.delayed(Duration(seconds: 3));

      setState(() {
        _isProcessing = false;
      });

      // Show success dialog
      _showOrderSuccessDialog();
    }
  }

  void _showOrderSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 80),
              SizedBox(height: 16),
              Text(
                'Order Placed Successfully!',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                'Your order #${DateTime.now().millisecondsSinceEpoch.toString().substring(7)} has been confirmed.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Estimated delivery: $_selectedDeliveryTime',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to previous page
                Navigator.of(context).pop(); // Go back to menu
              },
              child: Text('Continue Shopping'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                // Navigate to order tracking page (implement as needed)
              },
              child: Text('Track Order'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _pincodeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text(
          "Checkout",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontFamily: 'Lobster',
          ),
        ),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.redAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Order Summary Section
                    _buildSectionHeader('Order Summary'),
                    _buildOrderSummary(),

                    SizedBox(height: 24),

                    // Delivery Information Section
                    _buildSectionHeader('Delivery Information'),
                    _buildDeliveryForm(),

                    SizedBox(height: 24),

                    // Delivery Time Section
                    _buildSectionHeader('Delivery Time'),
                    _buildDeliveryTimeSelection(),

                    SizedBox(height: 24),

                    // Payment Method Section
                    _buildSectionHeader('Payment Method'),
                    _buildPaymentMethodSelection(),

                    SizedBox(height: 24),

                    // Special Notes Section
                    _buildSectionHeader('Special Notes (Optional)'),
                    _buildNotesField(),

                    SizedBox(height: 100), // Space for bottom bar
                  ],
                ),
              ),
            ),

            // Bottom checkout bar
            _buildCheckoutBottomBar(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _buildOrderSummary() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ...widget.cartItems
                .map(
                  (item) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            '${item['name']} x${item['quantity']}',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '₹${(item['price'] * item['quantity']).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),

            Divider(height: 20),

            _buildSummaryRow(
              'Subtotal',
              '₹${widget.totalAmount.toStringAsFixed(2)}',
            ),
            _buildSummaryRow(
              'Delivery Fee',
              '₹${deliveryFee.toStringAsFixed(2)}',
            ),
            _buildSummaryRow('Tax (5%)', '₹${taxAmount.toStringAsFixed(2)}'),

            Divider(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '₹${finalTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(fontSize: 14)),
          Text(value, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildDeliveryForm() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your full name';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if (value.length < 10) {
                  return 'Please enter a valid phone number';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Delivery Address *',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_on),
              ),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your delivery address';
                }
                return null;
              },
            ),

            SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _cityController,
                    decoration: InputDecoration(
                      labelText: 'City *',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter city';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _pincodeController,
                    decoration: InputDecoration(
                      labelText: 'Pincode *',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter pincode';
                      }
                      if (value.length != 6) {
                        return 'Invalid pincode';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryTimeSelection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children:
              _deliveryTimes
                  .map(
                    (time) => RadioListTile<String>(
                      title: Text(time),
                      value: time,
                      groupValue: _selectedDeliveryTime,
                      onChanged: (value) {
                        setState(() {
                          _selectedDeliveryTime = value!;
                        });
                      },
                      activeColor: Colors.redAccent,
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSelection() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children:
              _paymentMethods
                  .map(
                    (method) => RadioListTile<String>(
                      title: Text(method),
                      value: method,
                      groupValue: _selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          _selectedPaymentMethod = value!;
                        });
                      },
                      activeColor: Colors.redAccent,
                      secondary: Icon(_getPaymentIcon(method)),
                    ),
                  )
                  .toList(),
        ),
      ),
    );
  }

  IconData _getPaymentIcon(String method) {
    switch (method) {
      case 'Cash on Delivery':
        return Icons.money;
      case 'Online Payment':
        return Icons.payment;
      case 'UPI Payment':
        return Icons.account_balance_wallet;
      case 'Card Payment':
        return Icons.credit_card;
      default:
        return Icons.payment;
    }
  }

  Widget _buildNotesField() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextFormField(
          controller: _notesController,
          decoration: InputDecoration(
            labelText: 'Special instructions for delivery',
            border: OutlineInputBorder(),
            hintText: 'e.g., Ring the doorbell, Leave at door, etc.',
          ),
          maxLines: 3,
        ),
      ),
    );
  }

  Widget _buildCheckoutBottomBar() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '₹${finalTotal.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isProcessing ? null : _processOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child:
                  _isProcessing
                      ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 12),
                          Text(
                            'Processing Order...',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )
                      : Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }
}
