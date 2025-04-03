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
          "private_key_id": "b4cf5b5cd46e87c031261a522150471ce8839a28",
          "private_key":
              "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC9f3T2TIqoiF1X\nwxhOCgzX8F1qwzrRW0Nwp3HwXwWrM8cEnXcWPKs/Uu68qBtVCRc6PpE09WoaAoab\nq4L9s+7ChGqBv0HkA6edC9mi3BOKyMzC46zXX/aUNQj4aXY+W2iPMBUY/SxEbzid\nqPLb0+Fj4q+1RQqa0LoPOUIc/uT52mT9R/8nDvo7sSTB2NkKD8JnmBtAcoQYaMY8\nSdvRGEVN0TO3+aAhOOKjELLhrQDvnOOiwGmJHvTyYYpSsuQswYMgIgELpgmDX2t1\nh6E/gO1aIoIKDrJ+FOTWFw5etf8DTVePrs8pqk33q1sa0jJ84qaROxsBx1VwmOGD\ngqIaozXDAgMBAAECggEACU4ic1vD1/hw7k0oEDZMdigZS5Olpj/UhR970qwKg7h/\nAS+C+Fu8pFc8COs6WF0iFQabK8i8pTqoMH8QvMjipGOgipmBMKNV+OTAPaU6l8SP\netHM8XsxXmASU4ceOtFTRkC8BdDyJQl5yWgmm3vWjrNEIeMaMmBQhUyFqMCC2Zqg\nVjTBj5TGFqehW5UArTJmAWVp80IJaUWXTTUueXjxlBwApB51KruyUSXybETBdb3S\nhVGtXY2JESJ7Vg3RHQdIxhtu9WoNEqVe8l7G3+MUYM5rwO66M27aIDhGju01fy9X\nxCyVVWEC6DAqTjVVFe/qwQCA1PUnHJxirxWkhF9GcQKBgQDm2QaIlN0hnMubtbyq\n6eddgAWmabccXG8axBUUHCuoftqW+9d+gC9uhi5W/vMprdO+qHdYJ9C+KijK1Vxp\n7WpmUayelbVXktglXqJxzUAxAa/PEWKZxiQQEAFbX5GFCcu41Ed0FseRbEPdCWsD\nKp7yUF6Mu1c8rTyz691MQn6+kwKBgQDSJRIBK6uD5OG+FtVthehQqZ+iRhZr8GXB\nyR8aF+b5SuFJXyxUoYMGqqUdQCr3jcj26Gyf5jZXBoR3lphzGbINVGbLpii2IG8t\nL1NJkJ4T81um3XtBqPEQqwGhgaWaVS9zT366p3fJln7aii+z9coL0OqfXi8uAhIp\nT/koco/6EQKBgQDVGhVI8jssc0UWSe+Py3tUugD9PWvXF5FNISPgO50l32zEolmt\nIoImwmF218X7fMcSowwA6khttBeSHuI/uvZU3CLBBqyv2hQEc1b8PSB73PXB7mea\nUuoplcza399C8+cHiZcomHrESTBglPgfpTGzuPN/cNW4Yqe95AeXBW9hVwKBgQCi\nOg3xK2ZH9syyc2wmFcbnZlse6d5rS3UyqXHCMguUDdNnUfqmBt1gqyG2OBAzdZhb\ny8f3lMAEZLqkm3Rq/r4ufiaxNj+dgeJxzmQMmYD/Q9JQOhDp+mLHDEzBApX2U6bC\n7O6XZ6sYy354dU8oLSnh/1Dw4MOpT933WI6vQ+mUEQKBgByoPW5/D8YymQldMLH+\nvQvOugvxhcbx9Zp6m2Ie8m2BWflyXO4e7HGu2uaRroDMYeLprmEl0lipXwalb92z\npE/jI0Rx7I83oRcLcMx0F+WGSFrFwrW6bYBw1gtPv3SUy+QBe9UjsCyo/Jmeu7nj\nWnUpDMzxU/Aus89Kdlu6E0NF\n-----END PRIVATE KEY-----\n",
          "client_email":
              "firebase-adminsdk-fbsvc@fir-tutorial-cfc61.iam.gserviceaccount.com",
          "client_id": "100472908179937681667",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url":
              "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url":
              "https://www.googleapis.com/robot/v1/metadata/x509/firebase-adminsdk-fbsvc%40fir-tutorial-cfc61.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        }),
        scopes);

    final accessServerKey = client.credentials.accessToken.data;
    // print("accessServerKey:----- $accessServerKey");
    return accessServerKey;
  }
}
