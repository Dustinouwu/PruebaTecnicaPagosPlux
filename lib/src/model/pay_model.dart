import 'dart:convert';


class TransaccionModel {
  String? fecha_transaccion;
  String? descripcion;
  String? extras;
  String? monto;
  String? numero_identificacion_cliente;
  String? numero_telefonico_cliente;
  String? estado_transaccion;
  String? tipo_pago;
  String? usuarioCreador;
  String? marcaTarjeta;
  String? bancoAdquiriente;
  String? voucher; 
  String? cuotas;
  String? tipoCredito;
  String? numMesesGracia;
  String? tieneInteres;
  String? valorInteres;
  String? numReferencia;
  String? numLote;
  String? numAutorizacion;
  String? resEstado;



  TransaccionModel({
    this.fecha_transaccion,
    this.descripcion,
    this.extras,
    this.monto,
    this.numero_identificacion_cliente,
    this.numero_telefonico_cliente,
    this.estado_transaccion,
    this.tipo_pago,
    this.usuarioCreador,
    this.marcaTarjeta,
    this.bancoAdquiriente,
    this.voucher,
    this.cuotas,
    this.tipoCredito,
    this.numMesesGracia,
    this.tieneInteres,
    this.valorInteres,
    this.numReferencia,
    this.numLote,
    this.numAutorizacion,
    this.resEstado,
  });


  factory TransaccionModel.fromJson(Map<String, dynamic> json) {
    return TransaccionModel(
      fecha_transaccion: json["fecha_transaccion"],
      descripcion: json["descripcion"],
      extras: json["extras"],
      monto: json["monto"],
      numero_identificacion_cliente: json["numero_identificacion_cliente"],
      numero_telefonico_cliente: json["numero_telefonico_cliente"],
      estado_transaccion: json["estado_transaccion"],
      tipo_pago: json["tipo_pago"],
      usuarioCreador: json["usuarioCreador"],
      marcaTarjeta: json["marcaTarjeta"],
      bancoAdquiriente: json["bancoAdquiriente"],
      voucher: json["voucher"],
      cuotas: json["cuotas"].toString(),
      tipoCredito: json["tipoCredito"],
      numMesesGracia: json["numMesesGracia"].toString(),
      tieneInteres: json["tieneInteres"],
      valorInteres: json["valorInteres"],
      numReferencia: json["numReferencia"],
      numLote: json["numLote"],
      numAutorizacion: json["numAutorizacion"],
      resEstado: json["resEstado"],
    );
  }
}
