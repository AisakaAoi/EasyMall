package easymall.service;

import easymall.po.User;

public interface UserService {
	//�û���¼���ܣ�����User����� 
	public User login(User user);
	
	//����û��Ƿ��ѱ�ע�� 
	public boolean checkUsername(String username);
	
	//ע���û�
	public int regist(User user);

}
