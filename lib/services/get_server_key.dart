import 'package:googleapis_auth/auth_io.dart';

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    final client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-tutorial-cfc61",
          "private_key_id": "43f20ad42138729386c652e47f0aa61f186859e1",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCSvGw5I0M+u2bB\ng97NR8+90sUAQRgJwKEJbylEkNuVMvtm76qbt+HHPziCAWtB9abozYA6OiIeopR2\nvlhIS699nHLQgq4eff2mY6R5BgA7fJ//CjTkmUp8JDMBHsXd68FU397OJSd6UkKh\nHk9FU9lWDZ2HD2hkwBWKjjEfXdr4oCEl3URhjeUES86ZdjDi2XRWeYxTHOOuI+zS\nCfcYHGPvT5z3KcTNhmP/WwRWtS3sm68AG9as/rAArBJNg7ICgHOqrzFYDinnIccZ\nlZZkVq15BdRfNsJZBirUlMfzU+ahx7+0pETi/0tv3M7Ps0IauSs2N753s1GiIflo\new4kpMv1AgMBAAECggEABXlHbTs6RTMO8n2VmGFLJ9jetfN3rtdzemtd5fukYVSx\nSaX7nor1vm3GkRz18BQ2mX0fAS0NfEiS0ronh2zhW0V0iAAz+Bm5llUlu8kERbPQ\nsR4jmnp4a5ibGXnZJj3m7KBcSqLarea3KxT7Hoox85KW84SY35dFxnEm9nVVF4yt\nLUYFvt0MqNJp/75fo6z7gRmj2tZg2/TBbe+38srmSkkwbAhOIN88k+7W3OMsel3e\n9LpaM2325uZhu35BYtUh7fm2X2ofUap+zlNOEUwvjvyNxcB2ne36GYHlMv/y4yxo\nQgchP5y46cPQEUR//mzpvV5LxsoG/Sm0fP7pUVdH+QKBgQDL8o1+QBQcSRv7sO2T\nOp61Uwjj5egAUxvMiqL6EACMsYeYEteXvn4T0FfKDhmjmjb8Udra7B/yWh3FzMWm\nRiLeG8AbR1c2ShZ93Q/tF3IsOmy+5gf7NSKa82EQMxydeKrW3OawtbhiNZ7/62Ge\nyzz711JuWPPWWKTLUoWiqubgfQKBgQC4L88aucBpUujze+6lWTW6KWj3VMHxln9U\nOSVK1UkzFRoek3U2VWNreFjucmJ8NRbV2rLrfkEp4w0Kn+Vno7QTrN4In1X87dMI\nBKvyEOQZ36L6ejs5+HLppcb6BQzPUBaOKsOzq6TWRoxBs9r4Kbgd2pygS8uth6s9\nCfQGlUwq2QKBgCP0lSFm5qS99uL+pEPKl+RbyTt0ctxryoDbCDSR0ab8PW2AFOY5\nvTx9BJ0oszh2na8KN01VR6SQYqNWoJnZz5fcyJeGkkeN9D0oVgB0m7pUaouVPl75\nVSqAMeKLQEY62dObikgpIWKfFXME6mb2ab/0jCHMKODnK9Z0q/6rppx5AoGAOw7p\nY3JoJd114Iy+iro+JgEdLSE6RtKw5TqloIcfP4fmpiM2FEPw6wbdzSdUOOt09QF5\nGVWUY2/wQJXgowi0txJY537fvYgsgIeu8qFD4p/4zEPhNcdaYVzMnmJ8JwVRFijU\nM4o4ApUAaBjZf3UxGjF8w1FKb8vutlW4r1uz3pECgYEAt4sdk5uST3S0HvJNk2pX\nzdKwwDpgFefxbPIA+QSBoo/hKIHnowTrD9KmnRFG0Bp1rzwLEGOFtdpB+K2iziTB\nUK5beGCO2z3OPbvbkaErQV9YjnPAHFiKyYNPRZlks5fuDlprfWNPxHnBh3bqGoUC\nyW3dGPuXSEBZPwcK2Uv7GL0=\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-fbsvc@fir-tutorial-cfc61.iam.gserviceaccount.com",
          "client_id": "100472908179937681667",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-tutorial-cfc61.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);

    final accessServerKey = client.credentials.accessToken.data;
    // print("accessServerKey:----- $accessServerKey");
    return accessServerKey;
  }
}
