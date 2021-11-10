class form3Fields {
  static const fecha = 'fecha';
  static const horaInicio = 'hora inicio';
  static const horaFin = 'hora fin';
  static const lugarTrabajo = 'lugar trabajo';
  static const ubicacion = 'ubicación';
  static const altura = 'altura';
  static const tipoTrabajoAltura = 'tipo trabajo altura';
  //Las segundas variables son los vectores de los sw
  //Parte 4 form 4
  static const nombreapellidos = 'nombre y apellidos';
  static const cedula = 'cedula';
  static const arl = 'arl';
  static const eps = 'eps';
  static const cargo = 'cargo';

  //Parte 3
    static const vect3_1 = "Se dispone de los elementos necesarios para trabajar en alturas";
    static const vect3_2 = "Trabajadores autorizados y capacitados para el trabajo en alturas";
    static const vect3_3 = "Guantes de poliuretano y/o carnaza";
    static const vect3_4 = "Botas de seguridad dieléctricas";
    static const vect3_5 = "Gafas de seguridad";
    static const vect3_6 = "Casco con barbuquejo";
    static const vect3_7 = "Están todos los elementos de protección contra caídas";
    static const vect3_8 = "Eslinga con retenedor de caída dieléctricos";
    static const vect3_9 = "Gancho de la eslinga en buen estado";
    static const vect3_10 = "Retenedor de caída en buen estado";
    static const vect3_11 = "Arnes de seguridad dieléctrico";
    static const vect3_12 = "Argollas del arnes en buen estado";

  //Parte 4
    static const vect4_1 = "Los equipos utilizados se encuentran certificados y vigentes";
    static const vect4_2 = "Existen equipos contra incendios, en buen estado y próximos";
    static const vect4_3 = "Las condiciones físicas y psicológicas del personal son óptimas";
    static const vect4_4 = "Se señalizó y delimitó el área de trabajo";
    static const vect4_5 = "Se cuenta con todos los documentos del personal";
    static const vect4_6 = "Se cuenta con el AST/ correctamente diligenciado";
    static const vect4_7 = "El área de ejecución de la labor se encuentra limpia";

    static List<String> getFields() => [
          fecha,
          horaInicio, 
          horaFin,
          lugarTrabajo,
          ubicacion, 
          altura, 
          tipoTrabajoAltura,
          nombreapellidos,
          cedula, 
          arl,
          eps,
          cargo,
          vect3_1,
          vect3_2,
          vect3_3,
          vect3_4,
          vect3_5,
          vect3_6,
          vect3_7,
          vect3_8,
          vect3_9,
          vect3_10,
          vect3_11,
          vect3_12, 
          vect4_1, 
          vect4_2,
          vect4_3,
          vect4_4,
          vect4_5,
          vect4_6,
          vect4_7,
    ];

}