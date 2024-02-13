
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/daftar_view.dart';

class DaftarController extends State<DaftarView> {
    static late DaftarController instance;
    late DaftarView view;

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
        
    