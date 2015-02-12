package net.hb.boardMvc2;


public class ActionFactory2 {
	private static ActionFactory2 instance = new ActionFactory2();

	//private ActionFactory() {	super(); }//?Éù?Ñ±?ûê end

	public static ActionFactory2 getInstance() {
		return instance;
	}//end

	public Action2 getAction(String command) {
		Action2 action = null;
		System.out.println("ActionFactory2.java command=" + command);
		
		if  (command.equals("insert2.do")) {
		 	action = new InsertController2();
		}else if (command.equals("boardlist2.do")) {
			action = new BoardListController2();
		} else if (command.equals("boarddetail2.do")) {
		 	action = new BoardDetailController2();
		} else if (command.equals("board2.do")) {
		 	action = new Board2Controller2();		
		} else if (command.equals("detail.do")) {
		 	action = new DetailController();	
		}
		return action;
	}//end
	
}//ActionFactory class end
