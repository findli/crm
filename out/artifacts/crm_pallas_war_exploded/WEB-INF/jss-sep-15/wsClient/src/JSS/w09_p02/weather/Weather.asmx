<?xml version="1.0" encoding="utf-8"?>
<wsdl:definitions xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://ws.cdyne.com/WeatherWS/" xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" targetNamespace="http://ws.cdyne.com/WeatherWS/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://ws.cdyne.com/WeatherWS/">
      <s:element name="GetWeatherInformation">
        <s:complexType />
      </s:element>
      <s:element name="GetWeatherInformationResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetWeatherInformationResult" title="tns:ArrayOfWeatherDescription" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfWeatherDescription">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="WeatherDescription" title="tns:WeatherDescription" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="WeatherDescription">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="WeatherID" title="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Description" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="PictureURL" title="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetCityForecastByZIP">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ZIP" title="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCityForecastByZIPResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetCityForecastByZIPResult" title="tns:ForecastReturn" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ForecastReturn">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Success" title="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ResponseText" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="State" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="City" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WeatherStationCity" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="ForecastResult" title="tns:ArrayOfForecast" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfForecast">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="Forecast" nillable="true" title="tns:Forecast" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="Forecast">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Date" title="s:dateTime" />
          <s:element minOccurs="1" maxOccurs="1" name="WeatherID" title="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Desciption" title="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="Temperatures" title="tns:temp" />
          <s:element minOccurs="1" maxOccurs="1" name="ProbabilityOfPrecipiation" title="tns:POP" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="temp">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="MorningLow" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="DaytimeHigh" title="s:string" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="POP">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Nighttime" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Daytime" title="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetCityWeatherByZIP">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ZIP" title="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetCityWeatherByZIPResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="GetCityWeatherByZIPResult" title="tns:WeatherReturn" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="WeatherReturn">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Success" title="s:boolean" />
          <s:element minOccurs="0" maxOccurs="1" name="ResponseText" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="State" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="City" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WeatherStationCity" title="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="WeatherID" title="s:short" />
          <s:element minOccurs="0" maxOccurs="1" name="Description" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Temperature" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="RelativeHumidity" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Wind" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Pressure" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Visibility" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="WindChill" title="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Remarks" title="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="ArrayOfWeatherDescription" nillable="true" title="tns:ArrayOfWeatherDescription" />
      <s:element name="ForecastReturn" nillable="true" title="tns:ForecastReturn" />
      <s:element name="WeatherReturn" title="tns:WeatherReturn" />
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetWeatherInformationSoapIn">
    <wsdl:part name="parameters" element="tns:GetWeatherInformation" />
  </wsdl:message>
  <wsdl:message name="GetWeatherInformationSoapOut">
    <wsdl:part name="parameters" element="tns:GetWeatherInformationResponse" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPSoapIn">
    <wsdl:part name="parameters" element="tns:GetCityForecastByZIP" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPSoapOut">
    <wsdl:part name="parameters" element="tns:GetCityForecastByZIPResponse" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPSoapIn">
    <wsdl:part name="parameters" element="tns:GetCityWeatherByZIP" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPSoapOut">
    <wsdl:part name="parameters" element="tns:GetCityWeatherByZIPResponse" />
  </wsdl:message>
  <wsdl:message name="GetWeatherInformationHttpGetIn" />
  <wsdl:message name="GetWeatherInformationHttpGetOut">
    <wsdl:part name="Body" element="tns:ArrayOfWeatherDescription" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPHttpGetIn">
    <wsdl:part name="ZIP" title="s:string" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPHttpGetOut">
    <wsdl:part name="Body" element="tns:ForecastReturn" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPHttpGetIn">
    <wsdl:part name="ZIP" title="s:string" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPHttpGetOut">
    <wsdl:part name="Body" element="tns:WeatherReturn" />
  </wsdl:message>
  <wsdl:message name="GetWeatherInformationHttpPostIn" />
  <wsdl:message name="GetWeatherInformationHttpPostOut">
    <wsdl:part name="Body" element="tns:ArrayOfWeatherDescription" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPHttpPostIn">
    <wsdl:part name="ZIP" title="s:string" />
  </wsdl:message>
  <wsdl:message name="GetCityForecastByZIPHttpPostOut">
    <wsdl:part name="Body" element="tns:ForecastReturn" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPHttpPostIn">
    <wsdl:part name="ZIP" title="s:string" />
  </wsdl:message>
  <wsdl:message name="GetCityWeatherByZIPHttpPostOut">
    <wsdl:part name="Body" element="tns:WeatherReturn" />
  </wsdl:message>
  <wsdl:portType name="WeatherSoap">
    <wsdl:operation name="GetWeatherInformation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets Information for each WeatherID</wsdl:documentation>
      <wsdl:input message="tns:GetWeatherInformationSoapIn" />
      <wsdl:output message="tns:GetWeatherInformationSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City Forecast Over the Next 7 Days, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityForecastByZIPSoapIn" />
      <wsdl:output message="tns:GetCityForecastByZIPSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City's Weather, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityWeatherByZIPSoapIn" />
      <wsdl:output message="tns:GetCityWeatherByZIPSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="WeatherHttpGet">
    <wsdl:operation name="GetWeatherInformation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets Information for each WeatherID</wsdl:documentation>
      <wsdl:input message="tns:GetWeatherInformationHttpGetIn" />
      <wsdl:output message="tns:GetWeatherInformationHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City Forecast Over the Next 7 Days, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityForecastByZIPHttpGetIn" />
      <wsdl:output message="tns:GetCityForecastByZIPHttpGetOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City's Weather, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityWeatherByZIPHttpGetIn" />
      <wsdl:output message="tns:GetCityWeatherByZIPHttpGetOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:portType name="WeatherHttpPost">
    <wsdl:operation name="GetWeatherInformation">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Gets Information for each WeatherID</wsdl:documentation>
      <wsdl:input message="tns:GetWeatherInformationHttpPostIn" />
      <wsdl:output message="tns:GetWeatherInformationHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City Forecast Over the Next 7 Days, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityForecastByZIPHttpPostIn" />
      <wsdl:output message="tns:GetCityForecastByZIPHttpPostOut" />
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <wsdl:documentation xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">Allows you to get your City's Weather, which is updated hourly. U.S. Only</wsdl:documentation>
      <wsdl:input message="tns:GetCityWeatherByZIPHttpPostIn" />
      <wsdl:output message="tns:GetCityWeatherByZIPHttpPostOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="WeatherSoap" title="tns:WeatherSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetWeatherInformation">
      <soap:operation soapAction="http://ws.cdyne.com/WeatherWS/GetWeatherInformation" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <soap:operation soapAction="http://ws.cdyne.com/WeatherWS/GetCityForecastByZIP" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <soap:operation soapAction="http://ws.cdyne.com/WeatherWS/GetCityWeatherByZIP" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="WeatherSoap12" title="tns:WeatherSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="GetWeatherInformation">
      <soap12:operation soapAction="http://ws.cdyne.com/WeatherWS/GetWeatherInformation" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <soap12:operation soapAction="http://ws.cdyne.com/WeatherWS/GetCityForecastByZIP" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <soap12:operation soapAction="http://ws.cdyne.com/WeatherWS/GetCityWeatherByZIP" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="WeatherHttpGet" title="tns:WeatherHttpGet">
    <http:binding verb="GET" />
    <wsdl:operation name="GetWeatherInformation">
      <http:operation location="/GetWeatherInformation" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <http:operation location="/GetCityForecastByZIP" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <http:operation location="/GetCityWeatherByZIP" />
      <wsdl:input>
        <http:urlEncoded />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="WeatherHttpPost" title="tns:WeatherHttpPost">
    <http:binding verb="POST" />
    <wsdl:operation name="GetWeatherInformation">
      <http:operation location="/GetWeatherInformation" />
      <wsdl:input>
        <mime:content title="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityForecastByZIP">
      <http:operation location="/GetCityForecastByZIP" />
      <wsdl:input>
        <mime:content title="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetCityWeatherByZIP">
      <http:operation location="/GetCityWeatherByZIP" />
      <wsdl:input>
        <mime:content title="application/x-www-form-urlencoded" />
      </wsdl:input>
      <wsdl:output>
        <mime:mimeXml part="Body" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Weather">
    <wsdl:port name="WeatherSoap" binding="tns:WeatherSoap">
      <soap:address location="http://wsf.cdyne.com/WeatherWS/Weather.asmx" />
    </wsdl:port>
    <wsdl:port name="WeatherSoap12" binding="tns:WeatherSoap12">
      <soap12:address location="http://wsf.cdyne.com/WeatherWS/Weather.asmx" />
    </wsdl:port>
    <wsdl:port name="WeatherHttpGet" binding="tns:WeatherHttpGet">
      <http:address location="http://wsf.cdyne.com/WeatherWS/Weather.asmx" />
    </wsdl:port>
    <wsdl:port name="WeatherHttpPost" binding="tns:WeatherHttpPost">
      <http:address location="http://wsf.cdyne.com/WeatherWS/Weather.asmx" />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>