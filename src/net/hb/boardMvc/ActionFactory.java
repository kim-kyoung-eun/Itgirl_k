package net.hb.boardMvc;


public class ActionFactory {
	private static ActionFactory instance = new ActionFactory();

	//private ActionFactory() {	super(); }//?Éù?Ñ±?ûê end

	public static ActionFactory getInstance() {
		return instance;
	}//end

	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory.java command=" + command);
		
		if (command.equals("list.do")) {
			 action = new ListController();
		} else if (command.equals("insert.do")) {
		 	action = new InsertController();
		} else if (command.equals("detail.do")) {
			 action = new DetailController();
		} else if (command.equals("delete.do")) {
			 action = new DeleteController();
		} else if (command.equals("editPre.do")) {
			 action = new EditPreController( );
		} else if (command.equals("board.do")) {
			 action = new BoardController( );
		} else if (command.equals("boardList.do")) {
			 action = new BoardListController( );
		} else if (command.equals("boardDel.do")) {
			 action = new BoardDelController( );
		} else if (command.equals("edit.do")) {
			 action = new EditController();
		}
		return action;
	}//end
	
}//ActionFactory class end
