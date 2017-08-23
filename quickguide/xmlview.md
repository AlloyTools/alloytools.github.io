---
layout: page
title:  XML View
---

As implied by its name, the XML view displays an instance in XML format. If you save the XML text, you can load the instance later from the visualizer.

Here is a sample XML file:

	<alloy>

	  <sig	 name="Name" extends="univ">
	    <atom name="Name$0"/>
	    <atom name="Name$1"/>
	  </sig>

	  <sig name="Date" extends="univ">
	    <atom name="Date$0"/>
	  </sig>

	  <sig name="BirthdayBook" extends="univ">
	    <atom name="BirthdayBook$0"/>
	    <atom name="BirthdayBook$1"/>
	  </sig>

	  <field name="known">
	    <type> 
	      <sig name="BirthdayBook"/> 
	      <sig name="Name"/> </type>
	    </type>
    	    <tuple> 
    	      <atom name="BirthdayBook$1"/> 
          <atom name="Name$1"/> 
         </tuple>
	  </field>

	  <field name="date">
        <type> 
          <sig name="BirthdayBook"/> 
          <sig name="Name"/> 
          <sig name="Date"/> 
        </type>
        <tuple> 
          <atom name="BirthdayBook$1"/> 
          <atom name="Name$1"/> 
          <atom name="Date$0"/> 
        </tuple>
	  </field>
	</alloy>

	
	// had orphan instance element?