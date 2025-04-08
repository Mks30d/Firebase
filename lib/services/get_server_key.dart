import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

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
          "private_key_id": "696963d4cbdf0d3d348679a82b7956e183ef4401",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDliRkM2Yi7Xcp1\nIizD9BNEGhU8zVLu/Vr+jGFP8W4rygLPW2m6L+kaFOm+lHDhThF3h8SlzXcIfP9J\n3BRQVamlH3CYNAu0Hd3uKMgnLrAgW10RpRPw1boiUZss0anIU3HUVaXrVJPu8w3l\ndKCBirFTVqKXL7jcWJVhqNWXVjQ7Wkeu+q+Xv+VrBC58I3cqm9Dz71W8VqIPemlf\n9drIWWjwMy2M/cglmreN+Dqu6GBrRu9EYqj53+F8ChZ11XNWDo23iHmjuD6J5CAc\nab2ZCCpSb0vGkl6Ukti9ycmPelweAP8PBgrbomkYJoMaxhRLw0lRXyFRxwEwtjDt\nxR9G10gLAgMBAAECggEAD6/p/V3UoXGMh6rZQl8o/euGbgxeUaURFfqEIBGRBP8e\naAuIU0g49yZcv0Cn4k4SlYe64dYD/5mDXQnkfYUNPhLDADP2ZM3xv/gbjcn8EYoM\n90q/7SK+QOAw6cQ+hUlmqytbVpUGMzt7RKZO3eubqOVv4UNKsAyB0RXX2yryEOg+\ngVNCktb4vuTa88N3qvhvMQH3sIhWXq94NYb2spCInGEKHD61j687jb5pQIOk/oWU\nX1KAq93ReQ60ScIuBTNjMnG5/fGP4QfjYhhX7PV3shfT8RKkC2Do/VlWtkPlrv+A\npIIXisRtq5LqcZsGKaz6MsUbqXYXkferDYA0zG0OKQKBgQD0VIkixwnUm6CzG/gg\nLgBUga4Xe+/Y2pVX/5JiBPNnlsS7e7CSnXuyNotzOHBv5T3flTjk24nvapvjwilr\njoeDiiKVf9oROGZFKz/1nEzR+pq8Jmr63qcZgCQeTw1k9DqnoeE0TNpkMgrCUvM/\nkHC6He/a+meKLrVNrEUur5Ti1QKBgQDwf6pPtdEfvEOnsWusH6NOo6903R7jyF2O\n1VGu+UhyH1L7n/jqaCA1H/xpVOyQqgK5GV2MqA2CkIjQFPs0HEQWebSDKnddPO3M\np3K16KXRMfafsScnd65XQosz0a4u1rePCcP027bnk/E6b2CIcjZjjGiQGL6R7Lpb\nReLNSiovXwKBgHsgBqOR7fBIJOldlOKSi/QKDbMj77A2JsBbuGbQ2+A96BIauNaJ\nqgYa2pdLv82DlnSPfEZII/CUps5V0A21m7C78cWo0jmPVGpS6z5Yb5X5VfSu34Zg\noZCGNK1ZZQSU1uIW/6gdeoi3dxiKOK61mTkRUQfm3DqUYyUrRQnLzZmpAoGBAMOa\nojO4pkEQh1pB1FgnV1SjjxYWroQHOAju+UO93q1rSrv7TaGhVOjAfjRRbSLwE8zm\nk47ONEbINW5AUlv8zWgWTroL9Q9xedvlKUhI02zFHVie5kCUd8jjB4L6/Jd97ce5\n4pYpiabqTd4ALlxrwE7RKU5hwcW/64ZG3gOoWY0zAoGABzVD7MMndWVYnk17X7F5\n17H6MDRP1k+m5VQGiKNFNBo+YOpiLwowSF83l5vjZXJ0i7DVi1boRCAqXV63WJg4\nUj7b3NeReIK0ZdulGwc1Qmioz5t+n7AP+75yZw1Q7PhWC5mo3j2pYP1YKqZ46HFQ\nlfi6CEEOqKRIBwbApa9vo1A=\n-----END PRIVATE KEY-----\n",
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
