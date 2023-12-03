package com.exception.serviceImpl;

import java.util.ArrayList;

import com.exception.bean.ClassBean;
import com.exception.bean.StudentBean;
import com.exception.dao.StudentDao;
import com.exception.daoImpl.StudentDaoImpl;
import com.exception.service.StudentService;
import com.exception.util.StrUtil;

/** 
* @author 作者 Your-Name: 
* @version 创建时间：2021年5月24日 下午2:57:47 
* 类说明 
*/
public class StudentServiceImpl implements StudentService{

	private StudentDao studentDao = new StudentDaoImpl();

	@Override
	public ArrayList<StudentBean> queryAllStudent() {
		return studentDao.selectAllStudent();
	}

	@Override
	public ArrayList<StudentBean> querySomeStudentByInfo(StudentBean stu) {
		StringBuffer sql = new StringBuffer("select t_student.pk_id,t_student.f_name,t_student.f_sex,t_student.f_photo,t_student.f_phone,t_student.f_time,t_class.pk_id,t_class.f_name,t_class.f_teacher,t_class.f_time,t_room.pk_id,t_room.f_address,t_room.f_maxnum,t_room.f_stucount,t_room.f_price,t_room.f_master,t_room.f_phone,t_room.f_state,t_room.f_type,t_room.f_sextype,t_room.f_pay,t_room.f_time FROM t_student LEFT JOIN t_class ON t_student.fk_classid = t_class.pk_id JOIN t_room ON t_student.fk_roomid = t_room.pk_id where ");
		String sqls[] = new String[4];
		int i = 0;
		if(StrUtil.notEmpty(stu.getF_name())) {
			sqls[i++] = "t_student.f_name like '%" + stu.getF_name()+"%' ";
		}
		if(stu.getClassBean().getPk_id()!=-1) {
			sqls[i++] = "t_class.pk_id = " + stu.getClassBean().getPk_id();
		}
		if(stu.getRoomBean().getPk_id()!=-1) {
			sqls[i++] = "t_room.pk_id = " + stu.getRoomBean().getPk_id(); 
		}
		if(i == 0) {
			return studentDao.selectAllStudent();
		}
		sql = StrUtil.splicingStrs(i, sql, sqls);
		return studentDao.selectSomeStudentByInfo(sql.toString());
	}

	//学生入住
	@Override
	public boolean addStudent(StudentBean stu) {
		return studentDao.addStudentInfo(stu);
	}

	//学生换房
	@Override
	public boolean exchangeRoom(StudentBean stu, int oldId, int newId) {
		return studentDao.studentExchangeRoom(stu, oldId, newId);
	}

	//学生退房
	@Override
	public boolean deleteStudent(StudentBean stu) {
		return studentDao.deleteStudentInfo(stu);
	}



}
