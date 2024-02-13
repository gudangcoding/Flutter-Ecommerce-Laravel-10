
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/pencarian_view.dart';

class PencarianController extends State<PencarianView> {
    static late PencarianController instance;
    late PencarianView view;

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
        
    