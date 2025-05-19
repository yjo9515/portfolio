enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure, route }

enum TokenStatus { initial, hasToken, noToken, guestToken }

enum TokenType { none, authToken, refreshToken, customToken }

enum LoginStatus { login, logout }