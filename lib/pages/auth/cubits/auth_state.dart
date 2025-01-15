abstract class AuthState {}

/// Handle Login
class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {}

class AuthSuccess extends AuthState {}

class AuthLogout extends AuthState {}

/// Handle Register

class RegisterInitial extends AuthState {}

class RegisterLoading extends AuthState {}

class RegisterError extends AuthState {}

class RegisterSuccess extends AuthState {}
