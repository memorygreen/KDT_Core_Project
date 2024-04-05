package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.support.ServletContextScope;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.entity.Member;
import com.smhrd.entity.Product;
import com.smhrd.entity.Reply;
import com.smhrd.mapper.ProductMapper;

@Controller
public class ProductController {

	@Autowired
	private ProductMapper mapper;

	// '/'를 입력하면 ProductList.do 로 이동하도록 함(상품목록을 메인화면으로 설정)
	@RequestMapping("/")
	public String home() {
		return "redirect:/ProductList.do";

	}

	// 상품 목록 조회 (전체, 조회수순, 최저가순, 댓글 많은 순)
	@RequestMapping("/ProductList.do")
	public List<Product> ProductList(Model model, HttpSession session) {

		// 상품 전체 보기(메인)
		System.out.println("상품 전체보기 기능new");
		List<Product> prod_list = mapper.ProductList();
//		model.addAttribute("prod_list", prod_list); //request
		session.setAttribute("prod_list", prod_list); // 어차피 서버에 저장돼서 세션에 저장하는게 의미가 없을 듯

		// 조회순 보기
		System.out.println("상품 조회수순 보기");
		List<Product> prod_views_list = mapper.ProductViewsList();
		session.setAttribute("prod_views_list", prod_views_list);

		// 최저가순
		System.out.println("최저가순 보기");
		List<Product> prod_lowest_price_list = mapper.ProductLowestPriceList();
		session.setAttribute("prod_lowest_price_list", prod_lowest_price_list);

		// 댓글 많은순 보기
		System.out.println("상품 댓글 많은 순 보기");
		List<Product> prod_reply_list = mapper.ProductReplyList();
		session.setAttribute("prod_reply_list", prod_reply_list);

		// System.out.println(prod_list);// 확인용
		return prod_list;

	}

	@RequestMapping("/ProductForm.do")
	public String ProductForm() {
		System.out.println("게시글 쓰기 페이지 이동 기능");
		return "ProductForm";
	}

	// 자영추가(240401 19:21)

	@RequestMapping("/ProductInsert.do")
	public String ProductInsert(HttpServletRequest request, HttpSession session, Product prod) {

		System.out.println("게시글 입력 기능");

		// 세션에 입력된 로그인한 회원 확인
		System.out.println("로그인 여부 확인(세션 값 확인하기");
		Member loginUser = (Member) session.getAttribute("info");// 로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
		if (loginUser == null) { // 만약 로그인한 회원 정보가 없다면?(로그인x상태라면) 로그인페이지로 리다이렉트
			return "redirect:/login.do";
		}

		System.out.println("multi객체 생성");
		// 파일을 서버 폴더에 저장하는 객체 (240401 19:38이동)
		MultipartRequest multi = null;

		System.out.println("값 설정");
		int fileMaxSize = 10 * 1024 * 10000; // 파일크기
		// String savePath = request.getRealPath("/resources/img/saveimg"); //저장경로
		String savePath = request.getRealPath("/resources/img"); // 자영 : 2024.04.03. 20:08 강의듣고 다시
		System.out.println(savePath);

		System.out.println("try catch  설정");
		try {
			multi = new MultipartRequest(request, savePath, fileMaxSize, "UTF-8", new DefaultFileRenamePolicy());
			// 요청정보가진 request, 저장경로, 파일최대크기, 인코딩, 중복처리(파일명 같을 시 뒤에 숫자붙여주는 객체)
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("multi에 있는 값들 가져오기");
		
		String prod_name = multi.getParameter("prod_name");
		String prod_desc = multi.getParameter("prod_desc");
		String prod_img_path = multi.getFilesystemName("prod_img_path");
		String prod_price = multi.getParameter("prod_price");
		int prod_price_num = Integer.parseInt(prod_price);
		String seller_id = loginUser.getUser_id(); // seller_id에 로그인한 회원(loginUser)의 아이디 넣기

		// 욕설을 체크할 문자열 배열
		System.out.println("욕설 배열 생성");
		String[] BadWordList = { "시발", "새끼", "쌔끼", "후장뚫어18세키", "dogbaby", "18ㅅㅐㄲㅣ", "18ㅅㅔㅋㅣ", "yadong", "ㅌㅓㄹㅐㄱㅣ",
				"따아알따아리", "막대쑤셔줘?", "보지머리박기", "보지에자지껴", "보지에자지너", "보지핧아줄까", "여자ㄸㅏ먹기", "여자ㄸㅏ묵기", "조개마셔줘?", "조개벌려조?",
				"조개쑤셔줘?", "조개핧아줘?", "터래기터래기", "혀로보지핧기", "18nom", "18num", "18ㅅㅐ끼", "18ㅅㅔ키", "18세ㅋㅣ", "sex하자", "가슴조물락",
				"가슴주물럭", "가슴쪼물딱", "가슴쪼물락", "개씨발자슥", "개애거얼래", "개에거얼래", "개젓가튼넘", "개후라들놈", "개후라새끼", "걸레같은년", "괴에가튼?",
				"따먹어야지", "따아알따리", "떠어라아이", "또오라아이", "막대핧아줘", "미친씨부랄", "바주카자지", "버따리자지", "버어어지이", "버지따먹기", "버지물마셔",
				"버짓물마셔", "벌창같은년", "보지따먹기", "보지물마셔", "보지벌리자", "보지쥐어짜", "보지털뽑아", "보지틀래기", "보지핧아줘", "보짓물마셔", "빠아구우리",
				"사까아시이", "쉬이이이이", "쓰브랄쉽세", "야dong", "어미따먹자", "어미쑤시자", "여자따먹기", "여자따묵기", "유발조물락", "유방주물럭", "유방쪼물딱",
				"유방쪼물럭", "유우우방것", "자지빨아줘", "자지쓰레기", "자지핧아줘", "잠지물마셔", "잠짓물마셔", "젓가튼쉐이", "조개넓은년", "조개따조?", "조오우까튼",
				"좃만한쉐이", "좆같은새끼", "좆만한새끼", "쳐쑤셔박어", "촌씨브라리", "촌씨브랑이", "촌씨브랭이", "크리토리스", "클리토리스", "sibal", "fuck",
				"shit", "18새끼", "18세키", "boji", "bozi", "jaji", "jazi", "jot같", "sex해", "zaji", "zazi", "ㅅㅐㄲㅣ", "ㅆㅣㅂㅏ",
				"ㅆㅣ팍넘", "ㅇㅍㅊㅌ", "가슴만져", "가슴빨아", "가슴빨어", "가슴핧아", "가슴핧어", "강간한다", "같은새끼", "개가튼년", "개가튼뇬", "개같은년", "개거얼래",
				"개거얼레", "개념빠가", "개보지년", "개쓰래기", "개쓰레기", "개씁자지", "개씨발넘", "개애걸래", "개에가튼", "개에걸래", "개작두넘", "개작두년", "개잡지랄",
				"개저가튼", "개지랄넘", "개지랄놈", "개후라년", "걔잡지랄", "거지같은", "걸레보지", "걸레핀년", "게에가튼", "게지랄놈", "그나물에", "나쁜새끼", "난자마셔",
				"난자먹어", "난자핧아", "내꺼빨아", "내꺼핧아", "너거애비", "노무노무", "누나강간", "니씨브랄", "니아범?", "니할애비", "대애가리", "대에가리", "더어엉신",
				"더러운년", "덜은새끼", "돌은새끼", "동생강간", "뒤이치기", "뒤져야지", "뒤지고싶", "뒷잇치기", "드으응신", "따먹는다", "따먹었어", "따먹었지", "따먹을까",
				"따알따리", "떠어라이", "또오라이", "띠부우울", "띠이바알", "띠이버얼", "띠이이발", "띠이이벌", "맛없는년", "맛이간년", "미시친발", "미친구녕", "미친구멍",
				"미친새끼", "미친쉐이", "버어어지", "버어지이", "버지구녕", "버지구멍", "버지냄새", "버지뚫어", "버지뜨더", "버지벌려", "버지벌료", "버지빨아", "버지빨어",
				"버지썰어", "버지쑤셔", "버지핧아", "병신세리", "병신셰리", "병신씨발", "보지구녕", "보지구멍", "보지뚫어", "보지뜨더", "보지박어", "보지벌려", "보지벌료",
				"보지벌리", "보지보지", "보지빨아", "보지빨어", "보지자지", "보지정액", "보지찌져", "보지찢어", "보지털어", "보지핧아", "보지핧어", "뷰우웅신", "뷰웅시인",
				"빙신쉐이", "빠가야로", "빠가십새", "빠가씹새", "빠아구리", "빠아아라", "사까시이", "사까아시", "새77ㅣ", "성교하자", "섹스하자", "쉬이이이", "시미발친",
				"시미친발", "시바라지", "시바시바", "시박색히", "시박쉑히", "시발새끼", "시방색희", "시방쉑희", "시새발끼", "시입세에", "시친발미", "시팍새끼", "시팔새끼",
				"십탱구리", "십탱굴이", "십팔새끼", "싸가지없", "쌍쌍보지", "쓰래기같", "쓰레기새", "쓰바새끼", "씨가랭넘", "씨가랭년", "씨가랭놈", "씨박색희", "씨박색히",
				"씨박쉑히", "씨발병신", "씨뱅가리", "씨벌쉐이", "씨븡새끼", "씨새발끼", "씨입새에", "씨입세에", "씨팍새끼", "씨팍세끼", "씨퐁보지", "씨퐁자지", "씹탱굴이",
				"아아가리", "아오ㅅㅂ", "아오시바", "애미보지", "애미씨뱅", "애미자지", "애미잡년", "애미좃물", "어미강간", "엿먹어라", "오르가즘", "왕털버지", "왕털보지",
				"왕털자지", "왕털잠지", "유두빨어", "유두핧어", "유방만져", "유방빨아", "유방핧아", "유방핧어", "유우까압", "자기핧아", "자지구녕", "자지구멍", "자지꽂아",
				"자지넣자", "자지뜨더", "자지뜯어", "자지박어", "자지빨아", "자지빨어", "자지쑤셔", "자지정개", "자지짤라", "자지핧아", "자지핧어", "작은보지", "잠지뚫어",
				"젓대가리", "젓물냄새", "정액마셔", "정액먹어", "정액발사", "정액핧아", "정자마셔", "정자먹어", "정자핧아", "조개보지", "조개속물", "조오가튼", "조오까튼",
				"조오오조", "조오온니", "조오올라", "조온마니", "조옴마니", "조우까튼", "좀쓰레기", "좁빠라라", "좃가튼뇬", "좃대가리", "좃마무리", "좃만한것", "좃물냄새",
				"좃빠구리", "좃빠라라", "좆같은놈", "좆만한년", "좆만한놈", "좋만한것", "주둥아리", "지이라알", "쪼다새끼", "창녀버지", "창년벼지", "캐럿닷컴", "항문수셔",
				"항문쑤셔", "허버리년", "허벌보지", "허벌자식", "허벌자지", "헐렁보지", "호로새끼", "호로자슥", "호로자식", "호루자슥", "후라덜넘", "후우자앙", "후장꽂아",
				"후장뚫어", "18년", "18놈", "d쥐고", "d지고", "me췬", "me친", "me틴", "mi친", "mi틴", "ya동", "ㅁㅣ췬", "ㅂㅁㄱ", "ㅅ.ㅂ",
				"ㅅㄲ네", "ㅅㄲ들", "ㅅㅡ루", "ㅆㄹㄱ", "ㅆㅣ8", "ㅆㅣ댕", "ㅆㅣ뎅", "ㅆㅣ바", "ㅆㅣ발", "ㅇㅒ쁜", "ㅈ.ㄴ", "ㅈㅏ위", "ㅉ질한", "ㄱㅅㄲ", "개.웃",
				"개가튼", "개같이", "개걸래", "개걸레", "개고치", "개너미", "개라슥", "개마이", "개보지", "개부달", "개부랄", "개불랄", "개붕알", "개새기", "개새끼",
				"개색뀌", "개색휘", "개샛기", "개소리", "개쉐뀌", "개씁년", "개씁블", "개씨발", "개씨블", "개아기", "개자식", "개자지", "개잡년", "개저씨", "개저엇",
				"개지랄", "개후라", "걔잡년", "거시기", "걸래년", "걸레년", "게가튼", "게부럴", "게저엇", "계새끼", "괘새끼", "괴가튼", "굿보지", "김대중", "김치녀",
				"깨쌔끼", "나빼썅", "내미랄", "내미럴", "내버지", "내씨발", "내자지", "내잠지", "내조지", "노네들", "노알라", "노무현", "느그매", "니기미", "니미기",
				"니미랄", "니미럴", "니아범", "니애미", "니애비", "닝기리", "닥쳐라", "닥치세", "달달이", "달딸이", "닳은년", "대가리", "대음순", "더엉신", "돈새끼",
				"돌았네", "돌으년", "뒤져라", "뒤져버", "뒤져야", "뒤져요", "뒤지겠", "뒤지길", "뒤진다", "뒤치기", "뒷치기", "드응신", "디져라", "디지고", "따먹기",
				"따먹어", "따먹자", "딸달이", "딸딸이", "떠라이", "또라이", "또라인", "똘아이", "띠발뇬", "띠부울", "띠브울", "띠블넘", "띠이발", "띠이벌", "막간년",
				"맛간년", "미쳣네", "미쳤나", "미쳤니", "미치인", "미친ㅋ", "미친개", "미친넘", "미친년", "미친놈", "미친눔", "미친새", "미친색", "미티넘", "미틴것",
				"방점뱅", "백보지", "버어지", "버지털", "버짓물", "보지녀", "보지물", "보지털", "보짓물", "뷰웅신", "빠가냐", "빠간가", "빠가새", "빠가니", "빠구리",
				"빠구울", "빠굴이", "빠아가", "빡새끼", "빨치산", "사까쉬", "사까시", "사새끼", "새ㄲㅣ", "새끼라", "새끼야", "성교해", "성폭행", "세엑스", "세엑쓰",
				"섹스해", "소음순", "쉬방새", "쉬이바", "쉬이이", "쉽알넘", "슈ㅣ발", "슈우벌", "슨상님", "시댕이", "시바류", "시바알", "시바앙", "시발년", "시발놈",
				"시방새", "시벌탱", "시볼탱", "시부럴", "시부렬", "시부울", "시뷰럴", "시뷰렬", "시이발", "시입세", "시키가", "시팔넘", "시팔년", "시팔놈", "십버지",
				"십부랄", "십부럴", "십세리", "십세이", "십셰리", "십쉐끼", "십자석", "십자슥", "십지랄", "십창녀", "십팔넘", "싸가지", "싸물어", "쌍보지", "쌔엑스",
				"쎄엑스", "씨ㅂㅏ", "씨댕이", "씨바라", "씨바알", "씨발년", "씨발롬", "씨방새", "씨방세", "씨버럼", "씨벌년", "씨벌탱", "씨볼탱", "씨부랄", "씨부럴",
				"씨부렬", "씨불알", "씨뷰럴", "씨뷰렬", "씨브럴", "씨블년", "씨빠빠", "씨섹끼", "씨이발", "씨입새", "씨입세", "씨파넘", "씨팍넘", "씨퐁넘", "씨퐁뇬",
				"씹미랄", "씹버지", "씹보지", "씹부랄", "씹브랄", "씹빵구", "씹뻐럴", "씹뽀지", "씹새끼", "씹쉐뀌", "씹쌔끼", "씹자석", "씹자슥", "씹자지", "씹지랄",
				"씹창녀", "씹탱이", "씹팔넘", "아가리", "애미랄", "애애무", "애에무", "애에미", "애에비", "에애무", "에에무", "에에미", "에에비", "여어엄", "여엄병",
				"염병할", "엿이나", "왕버지", "왕자지", "왕잠지", "왜저럼", "유우깝", "유우방", "은새끼", "이새끼", "자압것", "자지털", "잠지털", "젓같내", "젓냄새",
				"젓만이", "정액짜", "젖탱이", "졌같은", "조가튼", "조오또", "조오웃", "조오지", "조온나", "조온니", "조온만", "조올라", "조옷만", "족같내", "족까내",
				"존.나", "존ㄴ나", "존나아", "존마니", "좀마니", "좃간년", "좃까리", "좃깟네", "좃냄새", "좃만아", "좃만이", "좃보지", "좃부랄", "좃빠네", "좆까라",
				"좆만아", "좆먹어", "좆빨아", "좆새끼", "좋오웃", "죠온나", "주글년", "주길년", "주둥이", "줬같은", "지껄이", "ㅈ1랄", "지이랄", "쪽바리", "찝째끼",
				"쳐받는", "쳐발라", "친구년", "친노마", "큰보지", "페니스", "허벌년", "허벌레", "허어벌", "호냥년", "호로자", "호로잡", "화낭년", "화냥년", "후.려",
				"후라덜", "후우장", "미칭럼", "느금마", "ㅈ같네", "ㅁㅊ", "ㅁ친", "ㅂㄹ", "ㅂㅊ", "ㅂ크", "ㅅㅂ", "ㅅㅍ", "ㅅㅋ", "ㅅ루", "ㅅ발", "ㅆㄺ",
				"ㅆㅂ", "ㅆㅣ", "ㅈㄴ", "ㅈㄹ", "ㅈ리", "강간", "개간", "개같", "개넷", "개년", "개놈", "개독", "개련", "개섹", "개셈", "개젓", "개좆",
				"개쩌", "게젓", "골빈", "공알", "구씹", "귀두", "꼭지", "년놈", "뇌텅", "뇨온", "늬믜", "늬미", "니년", "니믜", "니미", "닥쳐", "대갈",
				"돈년", "뒈져", "뒤졌", "뒤질", "등신", "디졌", "디질", "딴년", "띠바", "띠발", "띠벌", "띠벨", "띠불", "띠블", "런년", "럼들", "롬들",
				"맘충", "머갈", "믜칀", "믜친", "미띤", "미췬", "미칀", "미친", "미틴", "및힌", "발놈", "벌창", "벵신", "별창", "병닥", "병딱", "병맛",
				"병신", "병크", "보지", "봉알", "부랄", "불알", "붕신", "붕알", "븅신", "브랄", "빙띤", "빙신", "빠굴", "빠네", "빠라", "빠큐", "빻았",
				"빻은", "뻐규", "뻐큐", "뻑유", "뻑큐", "뻨큐", "뼈큐", "뽀지", "상년", "새끼", "새퀴", "새킈", "새키", "색희", "색히", "샊기", "샊히",
				"샹년", "섀키", "성괴", "성교", "세끼", "세키", "섹끼", "섹스", "쇅끼", "쇡끼", "쉐끼", "쉬박", "쉬발", "쉬버", "쉬빡", "쉬탱", "쉬팍",
				"쉬펄", "쉽세", "슈발", "슈벌", "스벌", "싑창", "시바", "시파", "시발", "시벌", "시빡", "시빨", "시탱", "시팍", "시팔", "시펄", "십녀",
				"십새", "십세", "십창", "십탱", "십팔", "싹스", "쌍년", "쌍놈", "쌔끼", "쌕스", "쌕쓰", "썅놈", "썅년", "썌끼", "쎄끼", "쎄리", "쎅스",
				"쎅쓰", "쒸8", "쒸댕", "쒸발", "쒸팔", "쒸펄", "쓰댕", "쓰뎅", "쓰렉", "쓰루", "쓰바", "쓰발", "쓰벌", "쓰벨", "쓰파", "씌8", "씌댕",
				"씌뎅", "씌발", "씌벨", "씌팔", "씝창", "씨8", "씨걸", "씨댕", "씨뎅", "씨바", "씨발", "씨벌", "씨벨", "씨블", "씨븡", "씨비", "씨빡",
				"씨빨", "씨뻘", "씨입", "씨팍", "씨팔", "씨퐁", "씹귀", "씹년", "씹덕", "씹못", "씹물", "씹새", "씹세", "씹쌔", "씹창", "씹치", "씹탱",
				"씹팔", "씹할", "아닥", "애무", "애미", "애비", "앰창", "야동", "엄창", "에무", "에미", "에비", "엠생", "엠창", "염병", "염뵹", "엿같",
				"옘병", "외퀴", "요년", "유깝", "유두", "유방", "육갑", "은년", "음경", "이년", "자위", "자지", "잠지", "짬지", "잡것", "잡년", "잡놈",
				"저년", "저엇", "저엊", "적까", "절라", "점물", "젓까", "젓떠", "젓물", "젓밥", "젖같", "젖까", "젗같", "젼나", "젼낰", "졏같", "조깟",
				"조또", "조온", "족까", "존귀", "존귘", "존나", "존낙", "존내", "존니", "존똑", "존맛", "존멋", "존버", "존싫", "존쎄", "존쎼", "존예",
				"존웃", "존잘", "존잼", "존좋", "존트", "졸귀", "졸귘", "졸라", "졸맛", "졸멋", "졸싫", "졸예", "졸웃", "졸잼", "졸좋", "좀물", "좁밥",
				"좃까", "좃넘", "좃도", "좃또", "좃물", "좃털", "종나", "좆까", "좆나", "좆년", "좆도", "좆물", "좆밥", "좆털", "좋만", "죠낸", "죤나",
				"죤내", "죵나", "쥐랄", "쥰나", "쥰내", "쥰니", "쥰트", "즤랄", "지랄", "지럴", "지롤", "지뢀", "지뢰", "짱깨", "짱께", "쪼녜", "쪼다",
				"쪽발", "쫓같", "쬰잘", "창남", "창녀", "창년", "창놈", "처먹", "첫빠", "쳐마", "쳐먹", "취ㅈ", "취좃", "친년", "친놈", "파친", "펑글",
				"항문", "허벌", "호로", "후려", "후장", "꽃휴", "ㅂㅅ", "걔섀", "느금", "늑음", "ㅈ같", "ㅄ", "凸", "뇬", "썅", "씹", "좃", "좆",
				"좇", "죶", "쫂", "쬲", "rosy palm and her 5 sisters", "son of a motherless goat",
				"fuckingshitmotherfucker", "leather straight jacket", "two fingers with tongue",
				"prince albert piercing", "missionary position", "alabama hot pocket", "chocolate rosebuds",
				"double penetration", "chick with a dick", "cleveland steamer", "leather restraint",
				"one cup two girls", "two girls one cup", "wrinkled starfish", "alaskan pipeline", "bang (one's) box",
				"female squirting", "one guy one jar", "reverse cowgirl", "taking the piss", "acrotomophilia",
				"beaver cleaver", "blow your load", "carpet muncher", "male squirting", "menage a trois",
				"motherfuckings", "mound of venus", "pleasure chest", "rusty trombone", "son of a bitch",
				"son of a whore", "son-of-a-bitch", "yellow showers", "2 girls 1 cup", "beef curtains", "brotherfucker",
				"brown showers", "carpetmuncher", "clitty litter", "clover clamps", "cop some wood", "dingleberries",
				"dirty pillows", "dirty sanchez", "fingerfuckers", "fingerfucking", "fingerfucking", "gender bender",
				"golden shower", "how to murdep", "how to murder", "masterbations", "mothafuckings", "mother fucker",
				"mother fucker", "motherfuckers", "motherfucking", "need the dick", "piece of shit", "sausage queen",
				"shaved beaver", "splooge moose", "suicide girls", "whorealicious", "window licker", "anal impaler",
				"anal leakage", "ball licking", "ball sucking", "barely legal", "beef curtain", "big knockers",
				"bunny fucker", "child-fucker", "cockmongruel", "cum dumpster", "cum dumpster", "cyberfuckers",
				"cyberfucking", "cyberfucking", "dawgie-style", "dendrophilia", "doggie style", "doggie-style",
				"donkey punch", "donkeyribber", "douchewaffle", "eat hair pie", "eat hair pie", "ejaculatings",
				"fingerfucked", "fingerfucked", "fingerfucker", "fingerfucker", "fistfuckings", "fistfuckings",
				"flog the log", "fuck buttons", "fuck yo mama", "fuck yo mama", "fuckersucker", "fudge packer",
				"fudge-packer", "goldenshower", "homodumbshit", "iberian slap", "jungle bunny", "make me come",
				"masterbating", "masterbation", "masturbating", "masturbation", "microphallus", "mothafuckers",
				"mothafucking", "mothafucking", "motherfucked", "motherfucker", "motherfuckin", "motherfuckka",
				"muthafuckker", "mutherfucker", "porch monkey", "pussy palace", "pussy palace", "pussylicking",
				"pussypounder", "raging boner", "shaved pussy", "sultry women", "sumofabiatch", "tittiefucker",
				"urethra play", "vorarephilia", "auto erotic", "baby batter", "beardedclam", "beastiality",
				"beaver lips", "blue waffle", "blue waffle", "bullet vibe", "bullshitted", "bust a load", "butt-pirate",
				"chi-chi man", "clit licker", "clusterfuck", "cock pocket", "cock sucker", "cockholster", "cockknocker",
				"cockmongler", "cockmuncher", "cocksniffer", "cock-sucker", "cocksuckers", "cocksucking", "coprolagnia",
				"coprophilia", "cum chugger", "cum chugger", "cum guzzler", "cum guzzler", "cumdumpster", "cunillingus",
				"cunnilingus", "cuntlicking", "cuntlicking", "cunt-struck", "cunt-struck", "cyberfucked", "cyberfucked",
				"cyberfucker", "deep throat", "dickbeaters", "dickflipper", "dick-sneeze", "dicksucking", "dicktickler",
				"dickwhipper", "dingleberry", "doggiestyle", "doggy style", "doggy-style", "donkeypunch", "double dong",
				"ejaculating", "ejaculating", "ejaculation", "f u c k e r", "fannybandit", "fannyfucker", "fartknocker",
				"fingerfucks", "fingerfucks", "fistfuckers", "fistfuckers", "fistfucking", "fistfucking", "foot fetish",
				"fuck puppet", "fuck puppet", "fuck trophy", "fuck trophy", "fudgepacker", "hardcoresex", "intercourse",
				"junglebunny", "lemon party", "master-bate", "master-bate", "mothafuckas", "mothafuckaz", "mothafucked",
				"mothafucked", "mothafucker", "mothafuckin", "motherfucka", "motherfucks", "muthafecker", "nimphomania",
				"nsfw images", "nymphomania", "pedophiliac", "penisbanger", "penisfucker", "penispuffer", "pillowbiter",
				"pole smoker", "porchmonkey", "pornography", "prickteaser", "sand nigger", "shit fucker", "shit fucker",
				"shitspitter", "slut bucket", "slut bucket", "spread legs", "style doggy", "tea bagging", "thundercunt",
				"tittyfucker", "two fingers", "unclefucker", "venus mound", "violet wand", "whorehopper", "asscracker",
				"ass-fucker", "ass-jabber", "assmuncher", "ass-pirate", "autoerotic", "baby juice", "ball gravy",
				"bestiality", "black cock", "bloodclaat", "booooooobs", "booty call", "bumblefuck", "buttcheeks",
				"buttfucker", "c0cksucker", "chota bags", "chota bags", "circlejerk", "cockburger", "cockfucker",
				"cockjockey", "cockknoker", "cockmaster", "cockmonkey", "cocknugget", "cocksmoker", "cocksucked",
				"cocksucked", "cocksucker", "cockwaffle", "cokmuncher", "corksucker", "corp whore", "corp whore",
				"crackwhore", "cumguzzler", "cunilingus", "cunthunter", "cuntlicker", "cuntlicker", "deepthroat",
				"dickdipper", "dickfucker", "dickmonger", "dickripper", "dicksipper", "dicksucker", "dickweasel",
				"dickzipper", "dog-fucker", "doggystyle", "dominatrix", "douchebags", "douche-fag", "eat a dick",
				"eat a dick", "eat my ass", "ejaculated", "ejaculates", "ejaculates", "faggotcock", "fannyflaps",
				"fingerbang", "fingerfuck", "fingerfuck", "fistfucked", "fistfucked", "fistfucker", "fistfucker",
				"fleshflute", "fuck-bitch", "fuck-bitch", "fuckbutter", "fucknugget", "gangbanged", "gayfuckist",
				"giant cock", "god-damned", "homoerotic", "kunilingus", "lovemaking", "m45terbate", "ma5terbate",
				"masterbat*", "masterbat3", "masterbate", "masturbate", "mothafucka", "mothafucks", "motherfuck",
				"muff diver", "muffdiving", "p.u.s.s.y.", "paedophile", "peckerhead", "pedophilia", "polesmoker",
				"poop chute", "poopuncher", "prostitute", "pussy fart", "pussy fart", "sandnigger", "scissoring",
				"shitbagger", "shitbrains", "shitbreath", "shitcanned", "slutdumper", "strip club", "teabagging",
				"twatwaffle", "undressing", "whorehouse", "analprobe", "anilingus", "assbandit", "assbanged",
				"assbanger", "assfucker", "assgoblin", "asshopper", "assjacker", "asslicker", "assmaster", "assmonkey",
				"assnigger", "asspirate", "asssucker", "ball sack", "barenaked", "bastinado", "batty boy", "bescumber",
				"bitch tit", "bitchtits", "bull shit", "bullshits", "bullturds", "bung hole", "butt fuck", "butt plug",
				"buttfucka", "buttmunch", "camel toe", "chesticle", "cock snot", "cockblock", "cockmunch", "cocksmith",
				"cocksmoke", "cocksucks", "cocksucks", "cocksukka", "cum freak", "cum freak", "cumbubble", "cumjockey",
				"cunt hair", "cunt hair", "cuntsicle", "cuntsicle", "cyberfuck", "cyberfuck", "date rape", "dick head",
				"dick hole", "dick hole", "dickheads", "dickjuice", "dog style", "douchebag", "dp action", "dumbasses",
				"ejaculate", "ejakulate", "fagfucker", "fist fuck", "fist fuck", "fistfucks", "fistfucks", "fuck hole",
				"fuck hole", "fuckbrain", "fuckheads", "fuckstick", "fuck-tard", "fucktards", "gang bang", "gang-bang",
				"gang-bang", "gangbangs", "gassy ass", "gassy ass", "goddamned", "goddamnit", "group sex", "hot chick",
				"jackasses", "jail bait", "jiggerboo", "knobjocky", "knobjokey", "m-fucking", "mothafuck", "muff puff",
				"muff puff", "muffdiver", "nob jokey", "octopussy", "pedophile", "phone sex", "pigfucker", "pissflaps",
				"poopchute", "queerbait", "queerhole", "rosy palm", "shitblimp", "shiteater", "shitfaced", "shitheads",
				"shithouse", "shitstain", "shittiest", "shittings", "skullfuck", "strappado", "threesome", "throating",
				"tittyfuck", "tittywank", "towelhead", "tribadism", "urophilia", "wet dream", "wh0reface", "whoreface",
				"zoophilia", "arsehole", "ass fuck", "ass hole", "assbangs", "assclown", "assfaces", "assfukka",
				"assholes", "assmucus", "assmucus", "assmunch", "assshole", "asswhole", "asswipes", "ball gag",
				"ballsack", "bangbros", "bastardo", "bastards", "beastial", "beeyotch", "big tits", "birdlock",
				"bitchass", "bitchers", "bitching", "blow job", "blow mud", "blowjobs", "blumpkin", "bollocks",
				"booooobs", "bulldyke", "bullshit", "bunghole", "buttfuck", "buttmuch", "buttplug", "c.o.c.k.",
				"cameltoe", "camwhore", "choc ice", "clitface", "clitfuck", "clitorus", "cockbite", "cockface",
				"cockhead", "cocklump", "cocknose", "cockshit", "cocksuck", "cocksuck", "cocksuka", "coksucka",
				"coonnass", "cornhole", "cornhole", "cumshots", "cumstain", "cuntface", "cunthole", "cuntlick",
				"cuntlick", "cuntslut", "cyberfuc", "daterape", "dick shy", "dick shy", "dickface", "dickfuck",
				"dickhead", "dickhole", "dick-ish", "dickmilk", "dickslap", "dickweed", "doochbag", "dry hump",
				"dumb ass", "dumbcunt", "dumbfuck", "dumbshit", "erection", "essohbee", "felching", "fellatio",
				"feltcher", "fistfuck", "foreskin", "frotting", "fuck off", "fuck you", "fuck-ass", "fuck-ass",
				"fuckbutt", "fuckedup", "fuckface", "fuckhead", "fuckhole", "fuckings", "fuckmeat", "fuckmeat",
				"fucknutt", "fucktard", "fucktart", "fucktwat", "fuckwhit", "fuckwitt", "futanari", "gangbang",
				"godsdamn", "goo girl", "goodpoop", "goregasm", "hand job", "horniest", "hot carl", "jack off",
				"jackhole", "jack-off", "jailbait", "jerk off", "jerk-off", "jiggaboo", "kinkster", "knobhead",
				"ma5terb8", "masterb8", "mcfagget", "nobjocky", "nobjokey", "numbnuts", "nut sack", "omorashi",
				"orgasims", "orgasmic", "pedobear", "phonesex", "phukking", "piss pig", "ponyplay", "poontang",
				"retarded", "s.h.i.t.", "shagging", "shit ass", "shitcunt", "shitdick", "shitface", "shitfuck",
				"shitfull", "shithead", "shithole", "shitings", "shitters", "shitters", "shittier", "shitting",
				"slanteye", "slutkiss", "sodomize", "strap on", "testical", "testicle", "tit wank", "tit wank",
				"tub girl", "twathead", "twatlips", "vajayjay", "veqtable", "whorebag", "a$$hole", "a55hole", "apeshit",
				"assbang", "assbite", "asscock", "assface", "assfuck", "assh0le", "ass-hat", "asshead", "assho1e",
				"asshole", "asslick", "assshit", "asswipe", "axwound", "ballbag", "bastard", "beaners", "bellend",
				"bestial", "bigtits", "bitched", "bitcher", "bitches", "bitchin", "blow me", "blowjob", "boiolas",
				"bollock", "bondage", "boobies", "boooobs", "breasts", "bumclat", "c.0.c.k", "c.u.n.t", "c-0-c-k",
				"camgirl", "camslut", "c-o-c-k", "cockass", "cockeye", "coochie", "cripple", "cumdump", "cumdump",
				"cumming", "cumshot", "cumslut", "cumtart", "c-u-n-t", "cuntass", "cuntbag", "cuntbag", "cuntrag",
				"dickbag", "dickish", "dickwad", "dickwod", "diligaf", "dipship", "dipshit", "dogging", "dolcett",
				"douchey", "dumbass", "dumshit", "erotism", "f u c k", "f.u.c.k", "f_u_c_k", "fagging", "faggitt",
				"faggots", "fagtard", "fcuking", "felcher", "fellate", "fisting", "footjob", "f-u-c-k", "fuckass",
				"fuckbag", "fuckboy", "fuckers", "fucking", "fucknut", "fuckoff", "fucktoy", "fucktoy", "fuckwad",
				"fuckwit", "fukkers", "fukwhit", "gay sex", "gayfuck", "gaytard", "goddamn", "handjob", "humping",
				"jackass", "jackoff", "jerk0ff", "jerkass", "jerkoff", "jigaboo", "kinbaku", "knobead", "knobend",
				"kooches", "lameass", "lardass", "mafugly", "mafugly", "nawashi", "nig nog", "nigaboo", "niggers",
				"nig-nog", "nobhead", "nutsack", "orgasim", "orgasms", "pegging", "phallic", "phuking", "phukked",
				"pisspig", "pollock", "poonani", "poonany", "punanny", "pussies", "raghead", "reetard", "rimming",
				"s_h_i_t", "schlong", "s-h-1-t", "shagger", "shaggin", "shemale", "shibari", "s-h-i-t", "shitass",
				"shitbag", "shiting", "shitted", "shitter", "shiznit", "slutbag", "sod off", "splooge", "strapon",
				"suckass", "t1tt1e5", "t1tties", "titfuck", "tittie5", "titties", "titwank", "tubgirl", "twunter",
				"upskirt", "vjayjay", "wankjob", "wetback", "whoring", "assbag", "asshat", "asswad", "azazel", "bampot",
				"beaner", "beatch", "beotch", "biatch", "bimbos", "bitchy", "bollok", "bollox", "boners", "booger",
				"booobs", "bootee", "bootie", "boozer", "bosomy", "buceta", "bugger", "bummer", "chincs", "chinky",
				"choade", "choade", "chodes", "clitty", "clunge", "coital", "commie", "coochy", "cooter", "crappy",
				"cretin", "crikey", "crotte", "cummer", "cummin", "cunnie", "cyalis", "d0uch3", "d0uche", "dammit",
				"dildos", "doggin", "dommes", "doofus", "dookie", "douch3", "douche", "dumass", "erotic", "escort",
				"extacy", "extasy", "fagbag", "fagged", "faggit", "faggot", "fagots", "fatass", "fcuker", "feltch",
				"femdom", "fenian", "fisted", "floozy", "fondle", "fooker", "fucked", "fucker", "fuckin", "fuckme",
				"fuckme", "fuckup", "fukker", "fukkin", "fukwit", "gayass", "gaybob", "gaysex", "gaywad", "gigolo",
				"goatcx", "goatse", "gokkun", "g-spot", "hentai", "heroin", "herpes", "homoey", "honkey", "hooker",
				"hotsex", "humped", "inbred", "incest", "jerked", "jizzed", "knobed", "kootch", "l3i+ch", "l3itch",
				"lezzie", "lolita", "molest", "moolie", "murder", "muther", "n1gger", "nambla", "nigg3r", "nigg4h",
				"niggah", "niggas", "niggaz", "nigger", "niglet", "nudity", "nympho", "opiate", "orgasm", "orgies",
				"peepee", "penial", "penile", "phuked", "pimpis", "polack", "pornos", "pricks", "punani", "punany",
				"pussys", "queero", "raping", "rapist", "raunch", "retard", "rimjaw", "rimjob", "ritard", "r-tard",
				"s.o.b.", "sadism", "sadist", "schizo", "scroat", "scrote", "shited", "shitey", "shitty", "smutty",
				"sodomy", "spooge", "stiffy", "stoned", "testee", "testes", "testis", "tities", "tosser", "tranny",
				"twatty", "undies", "v14gra", "vagina", "va-j-j", "wanker", "whored", "whores", "wigger", "yeasty",
				"a_s_s", "ahole", "arrse", "asses", "b!tch", "b00bs", "b17ch", "b1tch", "bi+ch", "bimbo", "bitch",
				"boned", "boner", "boobs", "booby", "boong", "booze", "boozy", "bosom", "busty", "chinc", "chink",
				"choad", "chode", "clits", "coons", "cunny", "cunts", "d1ld0", "d1ldo", "dicks", "dildo", "doosh",
				"dopey", "erect", "f4nny", "faggs", "fagot", "faigt", "fanyy", "fecal", "felch", "fisty", "fubar",
				"fucka", "fucks", "fuker", "fux0r", "gaydo", "gippo", "glans", "gooks", "gspot", "hobag", "honky",
				"horny", "juggs", "kafir", "kikes", "kooch", "labia", "leper", "lezza", "mo-fo", "moron", "mutha",
				"n1gga", "negro", "nigga", "nonce", "opium", "penis", "phuck", "phuks", "porno", "potty", "prick",
				"pubes", "pubic", "pubis", "pusse", "pussi", "pussy", "queaf", "queaf", "queef", "raped", "raper",
				"rapey", "renob", "rtard", "s hit", "scrog", "scrot", "semen", "shite", "shits", "shitt", "shota",
				"slave", "sluts", "snuff", "s-o-b", "spook", "spunk", "teets", "teste", "titty", "tramp", "tushy",
				"twats", "twunt", "v1gra", "vixen", "vulva", "wanky", "wazoo", "wh0re", "whoar", "whore", "yiffy",
				"yobbo", "zibbi", "2g1c", "4r5e", "5h1t", "5hit", "anal", "ar5e", "arse", "barf", "bdsm", "bint",
				"bong", "boob", "bung", "c0ck", "cawk", "cipa", "cl1t", "clit", "cnut", "coon", "crap", "cums", "cunt",
				"d0ng", "d1ck", "dick", "dlck", "fack", "fagg", "fags", "faig", "fcuk", "foad", "fuck", "fuck", "fuks",
				"fvck", "fxck", "gtfo", "h0m0", "h0mo", "hoer", "hom0", "hore", "japs", "jerk", "jism", "jizm", "jizm",
				"jizz", "jock", "kike", "kunt", "kwif", "kyke", "lube", "m0f0", "m0fo", "meth", "milf", "mof0", "mofo",
				"nude", "orgy", "p0rn", "paki", "phuk", "phuq", "pimp", "poof", "poon", "porn", "prig", "pron", "pthc",
				"pube", "puss", "quim", "rape", "scum", "seks", "sexo", "sh!+", "sh!t", "sh1t", "shag", "shi+", "shit",
				"shiz", "slut", "smut", "stfu", "taff", "taig", "tard", "teat", "teez", "titi", "tits", "titt", "turd",
				"tush", "tw4t", "twat", "wang", "wank", "yaoi", "zubb", "a$$", "a2m", "a55", "ass", "azz", "bbw", "cok",
				"cum", "fag", "fuc", "gfy", "jap", "jiz", "jiz", "pee", "s0b", "sex", "t1t", "tit", "vag", "wad", "wog",
				"wop", "wtf", "yid" }; // 욕설 내용 확인 필요

		
		String user_sc_nm =  loginUser.getUser_sc_nm();
		System.out.println("product dto에 multi에 있는 값 넣어주기");
		prod.setProd_name(prod_name);
		prod.setProd_desc(prod_desc);
		prod.setProd_img_path(prod_img_path);
		prod.setProd_price(prod_price_num); // 자영(0325):가격은 정수니까 문자열->정수 형변환
		prod.setSeller_id(seller_id); // 로그인한 회원(loginUser)의 id를 product(DTO)의seller_id에 넣기
		prod.setProd_sc_nm(user_sc_nm);
		
		System.out.println(prod.toString());// test용

		System.out.println("욕설 포함 확인 조건문");
		// 욕설이 포함되어 있는지 확인
		if (containsBadWords(prod.getProd_name(), prod.getProd_desc(), BadWordList)) {
			// 욕설이 포함되어 있으면 다시 상품등록 폼으로 리다이렉트
			return "redirect:/ProductForm.do?error=true";
		}

		// insert문 요청(욕설 및 비속어가 포함되지 경우)
		mapper.ProductInsert(prod);

		// return "boardList";
		return "redirect:/ProductList.do";

	}

	// 추가 (240401 1954)
	// 욕설 체크 메서드
	private boolean containsBadWords(String prodName, String prodDesc, String[] badWordList) {
		if (prodName == null || prodDesc == null || badWordList == null) {
			System.out.println("욕설체크 메소드 null값일 경우");
			return false; // 또는 예외 처리를 할 수 있습니다.
		}

		for (String badWord : badWordList) {
			if (prodName.contains(badWord) || prodDesc.contains(badWord)) {
				return true;
			}
		}
		return false;
	}

	/**********************************************************/

	// AJAX 요청 처리 메소드
	@RequestMapping("/ajax/ProductInsert.do")
	public @ResponseBody String ajaxProductInsert(HttpServletRequest request, HttpSession session, Product prod) {
		// 요청 처리 및 데이터베이스 삽입 로직
		return "Product inserted successfully!";
	}

	@RequestMapping("/ProductContent.do")
	public String ProductContent(@RequestParam("prod_idx") int prod_idx, Model model) {
		System.out.println("게시글 상세보기 기능");

		// 게시글 조회수 1 올리는 기능
		mapper.ProductCount(prod_idx);

		// prod변수에 해당 상품번호의 정보를 담기(상품1개 정보)
		Product prod = mapper.ProductContent(prod_idx);
		// model에 상품1개의 정보 담기
		model.addAttribute("prod", prod); // 상품1개 상세보기

		// 해당 게시글의 댓글들(list) 가져오기
		List<Reply> reply_list = mapper.replyList(prod_idx);
		model.addAttribute("reply_list", reply_list); // 모델에 해당상품식별자(prod_idx)에 대한 댓글들 목록 저장

		// ProductContent jsp(상품 상세보기 화면)로 보내주기
		return "ProductContent";

	}

	// (내가 등록한 상품일 경우) 판매중인 상품의 상태를 거래완료로 바꾸는 기능
	@RequestMapping("/productStatusChange.do")
	public String productStatusChange(@RequestParam("prod_idx") int prod_idx, Model model) {
		System.out.println("상품 게시글 상태 변경(판매중->거래완료)");
		mapper.productStatusChange(prod_idx);
		Product prod = mapper.ProductContent(prod_idx); // 업데이트 된 정보를 조회하기
		model.addAttribute("prod", prod); // 업데이트 된 정보를 담은 prod를 model에 담기
		return "ProductContent";
	}

	// 댓글작성(spring3에서 가져오기)
	@RequestMapping("/replyInsert.do")
	public String replyInsert(@RequestParam("prod_idx") int prod_idx,
			@RequestParam("reply_content") String reply_content, HttpSession session, Reply reply) {
		System.out.println("댓글 작성 기능");

		// 세션에서 현재 로그인한 사용자 정보 가져오기
		Member loginUser = (Member) session.getAttribute("info");// 로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
		String reply_writer_id = loginUser.getUser_id(); // reply_writer_id에 로그인한 회원(loginUser)의 아이디 넣기

		reply.setProd_idx(prod_idx); // 상품번호(식별자) 넣기
		reply.setReply_content(reply_content); // 댓글 내용 넣기
		reply.setReply_writer_id(reply_writer_id); // reply dto의 reply_writer_id 에 로그인한 회원(loginUser)의 아이디(info.user_id)
													// 넣기

		mapper.replyInsert(reply); // mapper에 댓글 넣는 기능 요청

		return "redirect:/ProductContent.do?prod_idx=" + reply.getProd_idx();// 댓글작성 완료 후 해당 상품번호의 상세보기 화면으로 이동

	}

	// 내 상품 게시글 목록 모아보기
	@RequestMapping("/goMyProductList.do")
	public String goMyProductList(Model model, HttpSession session, @RequestParam("user_id") String user_id) {
		System.out.println("내 게시글 목록으로 이동");

		return "redirect:/myProductList.do?user_id=" + user_id; // goMyProductList.do로 이동돼서 리다이렉트해봄
	}

	@RequestMapping("/myProductList.do")
	public List<Product> myProductList(Model model, HttpSession session, @RequestParam("user_id") String user_id) {
		System.out.println("내 게시글 목록으로 이동");

		// 세션에서 현재 로그인한 사용자 정보 가져오기
		Member loginUser = (Member) session.getAttribute("info");// 로그인한 회원의 정보를 세션에서 가져와서 loginUser라는 변수에 넣기
		String seller_id = loginUser.getUser_id(); // reply_writer_id에 로그인한 회원(loginUser)의 아이디 넣기
		System.out.println(seller_id);
		// 로그인한 회원의 id를 seller_id에 넣어서 mapper한테 select 함수 요청하기
		List<Product> my_prod_list = mapper.myProductList(seller_id);
		System.out.println(my_prod_list.size());
		model.addAttribute("my_prod_list", my_prod_list); // request

		return my_prod_list; // 리스트 전달
	}

	// 게시글 목록
	@RequestMapping("/Postmanagement.do")
	public String Postmanagement(Model model) {
		System.out.println("상품 전체보기 기능");
		List<Product> list = mapper.Postmanagement();
		model.addAttribute("list", list);

		return "Postmanagement";
	}

	// 게시글 수정하는 페이지
	@RequestMapping("/ModifyingPosts.do")
	public String ModifyingPosts(@RequestParam("prod_idx") int prod_idx, Model model) {
		System.out.println("게시글수정 페이지");
		Product Modifying = mapper.ModifyingPosts(prod_idx);
		model.addAttribute("Modifying", Modifying);
		return "ModifyingPosts";
	}

	// 게시글 정보 삭제하는 기능!!
	@RequestMapping("/Delete.do")
	public String Delete(@RequestParam("prod_idx") int prod_idx) {
		System.out.println("게시글 삭제 기능");
		mapper.Delete(prod_idx);
		return "redirect:/Postmanagement.do";
	}

	// 검색 기능
	@RequestMapping("/CombinedSearch.do")
	public String combinedSearch(@RequestParam("keyword") String keyword, Model model) {
		// 상품 제목과 내용으로 검색하는 로직을 수행
		List<Product> searchResult = mapper.combinedSearch(keyword);

		// 검색 결과를 모델에 담아 productList.jsp로 전달
		model.addAttribute("searchResult", searchResult);

		return "searchResult"; // productList.jsp로 이동
	}

}
