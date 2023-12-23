class Producto {
  String nombre;
  String descripcion;
  int precio;

  Producto({
    this.nombre = "",
    this.descripcion = "",
    this.precio = 0,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
        nombre: json['nombre'],
        descripcion: json['descripcion'],
        precio: json['precio']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;

    return data;
  }
}
