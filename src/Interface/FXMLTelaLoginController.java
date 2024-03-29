/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interface;

import Interface.TelaPrincipalController;
import static Interface.TelaPrincipalController.spnprincipal;
import Model.Usuario;
import com.jfoenix.controls.JFXPasswordField;
import com.jfoenix.controls.JFXTextField;
import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author Arthur
 */
public class FXMLTelaLoginController implements Initializable {

    @FXML
    private JFXTextField tb_Nome;
    @FXML
    private Button btn_logar;
    @FXML
    private Button btn_Sair;
    @FXML
    private JFXPasswordField pf_senha;
    
        private TelaPrincipalController ctr;
    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
    }    
    
    public void RecebeDados(TelaPrincipalController ctr){
        
       this.ctr = ctr;
       tb_Nome.requestFocus();
    }

    @FXML
    private void clkLogar(ActionEvent event) throws IOException, Throwable 
    {
        Usuario u= new Usuario(0,tb_Nome.getText(),pf_senha.getText(),0);
        if(u.isValido())
        {
            ctr.setLogin(u);
        }
        else
        {
            Alert a = new Alert(Alert.AlertType.ERROR);
            a.setContentText("Usuario ou senha incorretos ou inexistente!");
            a.showAndWait();
        }
    }

    @FXML
    private void clkSair(ActionEvent event) {
        ((Button)event.getSource()).getScene().getWindow().hide();
    }

    @FXML
    private void clkLogarENTER(KeyEvent event) throws Throwable {
        if(event.getCode() == KeyCode.ENTER)
           clkLogar(null);
            
    }
}
