import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class GetServerKey {
  Future<String> getServerKeyToken() async {
    final scopes = [
      'https://www.googleapis.com/auth/userinfo.email',
      'https://www.googleapis.com/auth/firebase.database',
      'https://www.googleapis.com/auth/firebase.messaging',
    ];

    late final client;
    try {
      client = await clientViaServiceAccount(
        ServiceAccountCredentials.fromJson({
          "type": "service_account",
          "project_id": "fir-tutorial-cfc61",
          "private_key_id": "f68ef92ba2dd5fd9786833a9269895eea89a9b62",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDIy69ZzBnIfw+y\nQaQhggaj3PrzrrobkgRMNx2qy7rN8AcNdJKxTSzJKkohnATuuNL2yUj+pTV1QrTj\n6rYGgSzSr290WdEFQOKhnZrywFMDdWzaiizbIA2BYRrljqFHmQ0Tq++AIVT59J4W\nzhC7DG/rVUOs2i8kmdGnmb5CHXgD2l3iP9PY/LrOL8cFYQyzKO2DVCSzMPBBHbxs\nDbWwQNv8dcUkyJKIQN6lCb2NQk3w8VScZoxtXzHZp/zERb1jtcIDBlRO+morAJ9i\nApXs6mOp2wQsD2iRHJGhPOdeQk0iutrAr5IqUc0SEdR/vI4DeJEVlpnnrbEnBG+Y\njIVJBPa9AgMBAAECggEAAuTyDsijCSwmXRrBHj0yPKPEzO+/KFfpzpzExV97voLa\njIEaVDVD6KppYyP365D9HtLhRc+6fjQ180sWJfCFZYwN0+QvinSC+nK7zF/6p67G\nS5LOTree5OHcx2Ok7ilF8lCkz84AhucrGDJkNK4F4aMwVIot6nMlKICjfhnP+bji\nLy00YpOn8X/aYF8S7SvoUXOBp7LwI6DtjRuC4Mo9lKawcd8sAz/E+CtKgT37seOK\nFGRnMp4MWA2wHRoj20F+rR3aOuCUlHtoiogH7fl2cHVpXgeMLAcSzG1pPrtL5x+o\nPaj27PfxOTNSZZrk9YCwfUsuaIlCaIGEF8MbTHyUKQKBgQD1Jv25BZJJ6VML+X5a\n/TuewyWn6pRnty95lF7SvtSuWkMIrGay6Ze770vEDBkE/f5jExtg7E2QHuI/5Pzv\nVBNDgkzcmJfIT39kS6soRwmaFbIufSaFLw52DYwVYTNXH1/9jeGPCItxTzrOp7fX\nCzny8/WimSd2cmcRcMcZ3mvPCwKBgQDRrjxC/gqMZyz6lEEw1MZsMSTLC6hSAWvd\nHpOcONfA0DG3cLe4TT2U5+VbddPwRyo8KzfE+N9T1gs/dVjOC0tAjN3HAa7Wrz7U\nqt9XyUWqhqZxYsh+sCAhflDLzqlv2NZt6gg1MZ5hO45TGONR3wwIujKpVjPFhMJs\nFNZ5zI0OVwKBgQC8CyKHr6xcoWqgPsobRS9cQlg6Cwe23p695X8urE47RuUwW/2S\nsvc+ovk88gKm/6UHnfpcSCXerLHjTORvN9Bm8iW++BVFAyW2awxoosTMumOooTrQ\n4h13lECljZ9x7pEUzqX7rxQ24A09wwyTGPtkTplWFaBdjLdee2FdiGytrQKBgEQv\npOkkM8n0w2u5SnnWt6/3Sz+8SsBgNfNyPg5PbdoF2iUNQrFsbNo/jxZu+rzoZ5Op\nejlTtUxODtpUDszyX0ZeiMBui6zE0GnYJ0kk6sLJhtbYiNqp68j4is28Jt14ZkLY\nGFM0D40PEPl03neBUSiFZHQs1CknQxJitFxnaHeBAoGBAKden4M4YPZcbJU/bSfK\nqFph6lkbkjxIxuwHdBOZ6fQvWXs4bbH2BdnV7ScgdQ31b4n04uIZDae1YmCmtTUT\n0fMx6HTRh1t285tBhajD5guHG5ZLuGo0L1agxjJSH48yJ/hMhdskC++wRSuTFxWK\n3KO1glHe7RulL4gB1GnLIMiW\n-----END PRIVATE KEY-----\n",
          "client_email": "firebase-adminsdk-fbsvc@fir-tutorial-cfc61.iam.gserviceaccount.com",
          "client_id": "100472908179937681667",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-tutorial-cfc61.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes,
      );
    } catch (e) {
      print("-----------getServerKeyToken, private_key error-----------");
    }

    final accessServerKey = client.credentials.accessToken.data;
    // print("accessServerKey:----- $accessServerKey");
    return accessServerKey;
  }
}
