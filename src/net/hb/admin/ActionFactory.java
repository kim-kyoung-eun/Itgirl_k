package net.hb.admin;

import net.hb.admin.Action;

public class ActionFactory {
		private static ActionFactory instance=new ActionFactory();
		
		private ActionFactory(){
				super();
		}
		public static ActionFactory getInstance(){
				return instance;
		}
		
		public Action getAction(String command){
				Action action=null;
				System.out.println("ActionFactory : "+ command);
				
				if(command.equals("List")){
						action=new ListController();
				}else if(command.equals("Detail")){
						action=new DetailController();
				}else if(command.equals("Insert")){
						action=new InsertController();
				}else if(command.equals("Delete")){
						action=new DeleteController();
				}else if(command.equals("Edit")){
						action=new EditController();
				}else if(command.equals("AdminMemberList")){
						action=new AdminMemberListController();
				}else if(command.equals("AdminMemberDetail")){
						action=new AdminMemberDetailController();
				}else if(command.equals("AdminMemberEdit")){
						action=new AdminMemberEditController();
				}
				
				
				return action;
		}
		
}
