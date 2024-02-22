
import 'package:flutter/material.dart';
import 'package:coba1/core.dart';
import '../view/daftar_belanja_view.dart';

class DaftarBelanjaController extends State<DaftarBelanjaView> {
    static late DaftarBelanjaController instance;
    late DaftarBelanjaView view;

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
        
    