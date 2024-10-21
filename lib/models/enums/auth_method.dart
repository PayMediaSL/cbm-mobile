enum AuthMethod {
  password("password"),
  fingerprint("fingerprint"),
  faceId("face_id");

  const AuthMethod(this.value);
  final String value;
}
