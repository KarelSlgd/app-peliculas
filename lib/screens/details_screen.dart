import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';

    return Scaffold(
      body: CustomScrollView(slivers: [
        _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          const _Overview(),
          const _Overview(),
          const CastingCards()
        ])),
      ]),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10),
          color: Colors.black12,
          child: const Text(
            'Maze Runner',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
              'https://img10.hotstar.com/image/upload/f_auto/sources/r1/cms/prod/9555/1369555-i-a1b6d41c1ded'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                  'https://m.media-amazon.com/images/I/61EobcMDLFL._AC_UF894,1000_QL80_.jpg'),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maze Runner',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'Correr o morir',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  SizedBox(width: 5),
                  Text('5/5', style: TextStyle(fontSize: 15))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: const Text(
          'Maze Runner: The Scorch Trials (titulada Maze Runner: Prueba de fuego en Hispanoamérica y El corredor del laberinto: Las pruebas en España) es una película estadounidense de ciencia ficción, suspense y acción dirigida por Wes Ball como adaptación cinematográfica del libro The Scorch Trials (2010), segundo de la trilogía de The Maze Runner, escrita por el autor estadounidense James Dashner. Protagonizada por Dylan OBrien, Kaya Scodelario, Thomas Brodie-Sangster, Ki Hong Lee, Rosa Salazar, Jacob Lofland y Giancarlo Esposito, la película estrenó el 18 de septiembre de 2015 en los Estados Unidos bajo la distribución de 20th Century Fox.​',
          style: TextStyle(fontSize: 16, color: Colors.black),
          textAlign: TextAlign.justify,
        ));
  }
}
