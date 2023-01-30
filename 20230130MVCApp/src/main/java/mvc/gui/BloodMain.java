package mvc.gui;

import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JOptionPane;

import mvc.model.blood.BloodAdvisor;

public class BloodMain extends JFrame{
	JComboBox<String> box;
	JButton bt;
	BloodAdvisor advisor; // 모델 객체 선언
	
	
	public BloodMain() {
		box = new JComboBox<String>();
		bt = new JButton("분석요청");
		advisor = new BloodAdvisor();
		
		// 혈액형 초기화
		box.addItem("A");
		box.addItem("B");
		box.addItem("O");
		box.addItem("AB");
		
		setLayout(new FlowLayout());
		add(box);
		add(bt);
		
		setVisible(true);
		setSize(300, 400);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setLocationRelativeTo(null);
		
		bt.addActionListener((e)->{
			getAdvice();
		});
	}
	public void getAdvice() {
		String result = advisor.getAdvice((String)box.getSelectedItem());
		JOptionPane.showMessageDialog(this, result);
	}
	public static void main(String[] args) {
		new BloodMain();
	}
}
