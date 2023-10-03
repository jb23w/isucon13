package scheduler

// スパムを取り出す (ただし、なるべく投稿数の少ないスパム)
// ライブコメントを取り出す (ただし、なるべく投稿数の少ないライブコメント)
// チップを取り出す
//// チップレベルを指定したら、それに合わせて金額を返すように

// ライブコメント数、スパム数などに応じて投げ銭するモチベーションを制御したい
// ただし、ゲーム性を損なわない範囲にしたいので、投げ銭してもらうまでの難易度が上がるというようにしたい

// 予約後、ライブ配信の処理が重くなるように、ライブコメント(+投げ銭)やリアクションなどを管理し、考える
// 投げ銭が偏るように采配するか、偏らないように分散させるか

// 配信の種類を決める
// * 通常
// * 人気
// * 炎上

// 炎上ノルマ達成か？
// 人気ノルマ達成か？
// などのメソッドをはやし、呼び出し側で未達成なら炎上配信者払い出しなどというふうにする
// 炎上配信者は、可能な限り人気があると良い
// 人気は、もちろん人気がまだないことが条件
// それ以外、通常に分類され、ユーザは通常配信者と視聴者になる

type LivestreamType int

const (
	LivestreamType_Normal  LivestreamType = iota
	LivestreamType_Popular                // 人気
	LivestreamType_Flame                  // 炎上
)

type LivecommentScheduler struct {
}
