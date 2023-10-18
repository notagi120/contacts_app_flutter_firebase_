import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;

// add new contacts to firestore
  Future addNewContacts(String name, String phone, String email) async {
    //与えられた引数を使用して、dataという名前のMapオブジェクトを作成します。このマップはFirestoreに送信されるデータです。
    Map<String, dynamic> data = {"name": name, "email": email, "phone": phone};
    //try-catchブロックを使用してエラーハンドリングを行います。awaitキーワードを用いて非同期処理を行い、
    //Firestoreの特定の「ドキュメント」のcontactsコレクションに新しいドキュメント（dataマップ）を追加します。
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);
      print("Document Added");
    } catch (e) {
      print(e.toString());
    }
  }

  // read documents inside firestore
//1. **`Stream<QuerySnapshot>`**: 関数が返す型は`Stream<QuerySnapshot>`です。
//`Stream`はDartで非同期イベントを扱うためのクラスで、`QuerySnapshot`はFirestoreのクエリ結果を格納するクラスです。
//この関数は、Firestoreから非同期にデータを取得し、それを`QuerySnapshot`形式でストリーミングします。
//2. **`async*`**: この関数は非同期ジェネレータ関数です。
//`async*`を使用すると、`yield`または`yield*`を使用して非同期にデータを生成できます。
//この関数が`Stream`を返す場合、それはこの`async*`によって生成されるストリームです。
//3. **`getContacts({String? searchQuery})`**: 関数名は`getContacts`で、オプショナルな名前付き引数`searchQuery`を取ります。
//この`searchQuery`は、特定の検索クエリに基づいて連絡先をフィルタリングする際に使用できるものです。
//引数が`null`である場合、フィルタリングは適用されません。
  Stream<QuerySnapshot> getContacts({String? searchQuery}) async* {
    //Firestoreクエリの作成: ユーザーのUIDに基づいて、Firestoreからcontactsコレクションを取得します。
    //このクエリはnameフィールドに基づいて並べられます。
    var contactsQuery = FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        //五十音順にソート
        .orderBy("name");

    // a filter to perfom search
    if (searchQuery != null && searchQuery.isNotEmpty) {
      //searchEndという新しい変数を作成しています。
      //この変数は、検索クエリの末尾に特殊なUnicode文字（\uf8ff）を加えたものです。
      //この特殊な文字は、ほとんどのテキストよりも字義的に後ろにくるため、この範囲内での検索が可能になります。
      String searchEnd = searchQuery + "\uf8ff";
      //この行は、Firestoreのクエリにフィルタリング条件を追加しています。
      //具体的には、「name」フィールドがsearchQuery以上で、searchEnd未満のドキュメントを検索します。
      contactsQuery = contactsQuery.where("name",
          isGreaterThanOrEqualTo: searchQuery, isLessThan: searchEnd);
    }

    var contacts = contactsQuery.snapshots();
    //contactsの各要素（データ）がそのままこの関数から出力される流れになります。
    yield* contacts;
  }
//snapshots()メソッドはFirebase Firestoreの機能の一つで、
//特定のコレクションまたはドキュメントに対するリアルタイムの更新を監視するために使用されます。
//このメソッドはStreamを返します。
//このStreamは、クエリに一致するドキュメントが追加、削除、または変更されるたびに更新されるQuerySnapshotオブジェクトを含んでいます。
//具体的には、snapshots()が出力するデータの流れ（Stream）に注意を払い、新しいデータが来たときにそれをキャッチすることで
//Firestoreのデータベース内で何らかの変更があった場合、その変更がリアルタイムで反映されます。
//このため、アプリケーションはデータベースの最新の状態を維持できます。

  // update a contact
  Future updateContact(
      String name, String phone, String email, String docID) async {
    Map<String, dynamic> data = {"name": name, "email": email, "phone": phone};
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .update(data);
      print("Document Upated");
    } catch (e) {
      print(e.toString());
    }
  }

  // delete contact from firestore
  Future deleteContact(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();
      print("Contact Deleted");
    } catch (e) {
      print(e.toString());
    }
  }
}
