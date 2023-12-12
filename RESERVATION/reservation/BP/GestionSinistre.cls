/// 
Class reservation.BP.GestionSinistre Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='reservation.msg.voitureCreerSinistreDmde' response='reservation.msg.voitureCreerSinistreRpse' height='2000' width='2000' >
<sequence xend='200' yend='350' >
<call name='CreerSinistre' target='Sinistre' async='0' xpos='200' ypos='250' >
<annotation><![CDATA[On appelle l'operation permettant de repertorier le sinitre]]></annotation>
<request type='reservation.msg.voitureCreerSinistreDmde' >
<assign property="callrequest" value="request" action="set" />
</request>
<response type='reservation.msg.voitureCreerSinistreRpse' >
<assign property="response" value="callresponse" action="set" />
</response>
</call>
<call name='envoie fichier sinistre' target='fileReservation' async='0' xpos='734' ypos='328' >
<request type='reservation.msg.pushSinistreFileDmde' >
<assign property="callrequest.plaque" value="request.plaque" action="set" />
<assign property="callrequest.sinistre.codeSinistre" value="request.sinistre.codeSinistre" action="set" />
<assign property="callrequest.sinistre.libelleSinistre" value="request.sinistre.libelleSinistre" action="set" />
<assign property="callrequest.sinistre.detailSinistre" value="request.sinistre.detailSinistre" action="set" />
</request>
<response type='reservation.msg.pushSinistreFileRpse' />
</call>
</sequence>
</process>
}

}

