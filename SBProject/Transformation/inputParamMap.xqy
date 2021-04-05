xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.example.org";
(:: import schema at "../XSDs/inout_param.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/top/dbDcvRequest";
(:: import schema at "../Resources/dbDcvRequest_table.xsd" ::)

declare variable $inp as element() (:: schema-element(ns1:inputParam) ::) external;

declare function local:inputParamMap($inp as element() (:: schema-element(ns1:inputParam) ::)) as element() (:: schema-element(ns2:dbDcvRequestSelect_pDcvNoInputParameters) ::) {
    <ns2:dbDcvRequestSelect_pDcvNoInputParameters>
        <ns2:pDcvNo>{fn:data($inp/ns1:noDcv)}</ns2:pDcvNo>
    </ns2:dbDcvRequestSelect_pDcvNoInputParameters>
};

local:inputParamMap($inp)
