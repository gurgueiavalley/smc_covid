import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hasura_connect/hasura_connect.dart';

var dados_localizacao;


var cor_base = Color(0XFF725AE8);


HasuraConnect hasuraConnect = HasuraConnect('https://smcovidpostgres.herokuapp.com/v1/graphql');
