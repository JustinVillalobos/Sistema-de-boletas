import { Component, OnInit } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {Router} from "@angular/router";
import {  trigger,
  state,
  style,
  animate,
  transition } from '@angular/animations';
  import { UsuarioService } from '../../Services/usuario.service';
import { IpService } from '../../Services/ip.service';
import {Usuario} from '../../Domain/usuario';
import { ToastService } from '../../Business/toast.service';
import { AlertsService } from '../../Business/alerts.service';
import { ValidatorService } from '../../Business/validator.service';
import Swal from 'sweetalert2';
@Component({
  selector: 'app-inicio-sesion',
  templateUrl: './inicio-sesion.component.html',
  styleUrls: ['./inicio-sesion.component.css'],
  animations: [
    trigger('fade', [ 
    	state('singInOff', style({
	     opacity: 0
	    })),
	    state('singInOn', style({
	     opacity: 1
	    })),
	    transition('singInOn => singInOff', animate("0.5s 0.5s")),
	    transition('singInOff => singInOn', animate("0.5s 0.5s")),
	    ]),
    trigger('fade2', [ 
	    state('singUpOff', style({
	     opacity: 0
	    })),
	    state('singUpOn', style({
	     opacity: 1
	    })),
	    transition('singUpOn => singUpOff', animate("0.5s 0.5s")),
	     transition('singUpOff => singUpOn', animate("0.5s 0.5s")),
	    ])
	]
})
export class InicioSesionComponent implements OnInit {
  stateJs:boolean=false;
  signUpCss:string="none";
  signInCss:string="block";
  signUpAnimation:string="singInOff";
  signInAnimation:string="singUpOn";
  ip:string="";
  correo:string="";
  password:string="";
  constructor(private UsuarioService:UsuarioService, 
    private router:Router,private toastr:ToastService, 
    private alertService:AlertsService, private ValidatorService:ValidatorService,
    private IpService:IpService) { 
    this.IpService.getIPAddress().subscribe((res:any)=>{  
      this.ip=res.ip; 

    });
    

  }
  
   
  ngOnInit(): void {
     localStorage.setItem("cedula","");
    localStorage.setItem("Id","");
  }

  signIn(){
  	if(this.stateJs===true){
  		this.signUpAnimation="singUpOff";
  		this.signInAnimation="singInOn";
  		this.signUpCss="none";
  		this.signInCss="block";
  		this.stateJs=false;
  	}
  }
  signUp(){
  	if(this.stateJs===false){
  		this.signUpAnimation="singUpOn";
  		this.signInAnimation="singInOff";	
  		this.signInCss="none";
  		this.signUpCss="block";
  		this.stateJs=true;
  	}
  }

  sesion(){
    //[sp_Session_insert]
    if(this.correo!="" && this.correo.length>0 && this.password!="" && this.password.length>0){
      if(this.ValidatorService.validarEmail(this.correo)){
        this.UsuarioService.getusuarioBySesion(this.correo,this.password,this.ip).subscribe(
            res=>{
              if(res[1]["Response"]===true && res[0]["Usuario"].length!=0){
                console.log(res);
                localStorage.setItem("cedula",res[0]["Usuario"][0]["Cedula"]);
                 localStorage.setItem("Id",res[0]["Usuario"][0]["idUsuario"]);
                 this.alertService.alertTimeCorrect("Inicio de sesión éxitosa",function(component_2){
                               component_2.correo="";
                               component_2.password="";
                               component_2.router.navigate(['/dashboard']);
               
                     },this);
               
              
              }else{
                 this.alertService.alertaError("El correo y contraseña no coincide con ningún usuario registrado");
              }
            },
            err=>console.log(err)
          );
        }else{
          this.toastr.toastrError("El correo ingresado no tiene un formato correcto");
        }
      }else{
         this.toastr.toastrError("Hay campos vacíos");
        
      }
      
    
  }

}
