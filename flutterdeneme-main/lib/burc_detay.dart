import 'package:flutter/material.dart';
import 'package:mobilprogramlama_1/burc_liste.dart';
import 'package:mobilprogramlama_1/sayfauc.dart';

import 'models/burc.dart';

class BurcDetay extends StatelessWidget {
  int gelenIndex;
  Burc secilenBurc;
  String title;
  String value;
  BurcDetay(this.gelenIndex);

  @override
  Widget build(BuildContext context) {
    secilenBurc = BurcListesi.tumBurclar[gelenIndex];
    value = "images/" + secilenBurc.burcBuyukResim;
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.blueGrey,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + secilenBurc.burcBuyukResim,
                fit: BoxFit.cover,
              ),
              centerTitle: true,
            ),
            title: Text(secilenBurc.burcAdi + " Ülkesi Hakkında..."),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Center(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      secilenBurc.burcDetay,
                      style: TextStyle(
                        fontSize: 40,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => sayfauc(value: value)));
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Text('Go Animated'),
        ),
      ),
    );
  }
}
