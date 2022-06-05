<?php
// include("../funcs.php")

//----------------------------------------------------
//１．入力チェック(受信確認処理追加)
//----------------------------------------------------
//商品名 受信チェック:item
// 送信されてきてない、又はポストが空ならば
if(!isset($_POST["item"]) || $_POST["item"] == "" ){
  exit("ParamError!item!");
}

//金額 受信チェック:value
if(!isset($_POST["value"]) || $_POST["value"] == "" ){
  exit("ParamError!value!");
}

//商品紹介文 受信チェック:description
if(!isset($_POST["description"]) || $_POST["description"] == "" ){
  exit("ParamError!description!");
}

//ファイル受信チェック※$_FILES["******"]["name"]の場合
if(!isset($_FILES["fname"]["name"]) || $_FILES["fname"]["name"] == "" ){
  exit("ParamError!Files!");
}



//----------------------------------------------------
//２. POSTデータ取得
//----------------------------------------------------
// 変数の定義
$fname  = $_FILES["fname"]["name"];   //File名
$item  = $_POST["item"];   //商品名
$value = $_POST["value"];   //価格(数字：intvalを使う)
$description = $_POST["description"];   //商品紹介文


//1-2. FileUpload処理
$upload = "../img/"; 

//画像アップロードフォルダへのパス [../一つ上の階層]
//アップロードした画像を../img/へ移動させる記述↓ 
// (move_upload_file(現在仮で置かれてる場所,起きたい場所のパスと名前)){}
if(move_uploaded_file($_FILES['fname']['tmp_name'], $upload.$fname)){
//   //FileUpload:OK
} else {
  //FileUpload:NG
  echo "Upload failed";
  echo $_FILES['fname']['error'];
}

//----------------------------------------------------
//３. DB接続します(エラー処理追加)
//----------------------------------------------------
// $pdo = connect_to_db();

try {
  $pdo = new PDO('mysql:dbname=gs_db07;charset=utf8;host=localhost','root','');
} catch (PDOException $e) {
  exit('DbConnectError:'.$e->getMessage());
}

//----------------------------------------------------
//４．データ登録SQL作成
//----------------------------------------------------
$stmt = $pdo->prepare("INSERT INTO ec_table(id, item, value, description, fname, indate )VALUES(NULL, :item, :value, :description, :fname,  now())");
$stmt->bindValue(':item', $item, PDO::PARAM_STR);
$stmt->bindValue(':value', $value, PDO::PARAM_INT); //数値
$stmt->bindValue(':fname', $fname, PDO::PARAM_STR);
$stmt->bindValue(':description', $description, PDO::PARAM_STR);
$status = $stmt->execute();

//----------------------------------------------------
//５．データ登録処理後
//----------------------------------------------------
if($status==false){
  //SQL実行時にエラーがある場合（エラーオブジェクト取得して表示）
  $error = $stmt->errorInfo();
  exit("QueryError:".$error[2]);
}else{
  //５．item.phpへリダイレクト
  header("Location: item.php");
  exit();
}
?>
