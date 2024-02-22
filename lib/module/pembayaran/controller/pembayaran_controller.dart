
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/pembayaran_view.dart';

class PembayaranController extends State<PembayaranView> {
    static late PembayaranController instance;
    late PembayaranView view;

    @override
    void initState() {
        instance = this;
        super.initState();
    }

    @override
    void dispose() => super.dispose();

    @override
    Widget build(BuildContext context) => widget.build(context, this);
}
        
    