/*
Copyright 2008-2020 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define LPROPDOCSTRING
"LProp module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_lprop.html"
%enddef
%module (package="OCC.Core", docstring=LPROPDOCSTRING) LProp


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<LProp_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import GeomAbs.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum LProp_Status {
	LProp_Undecided = 0,
	LProp_Undefined = 1,
	LProp_Defined = 2,
	LProp_Computed = 3,
};

enum LProp_CIType {
	LProp_Inflection = 0,
	LProp_MinCur = 1,
	LProp_MaxCur = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class LProp_Status(IntEnum):
	LProp_Undecided = 0
	LProp_Undefined = 1
	LProp_Defined = 2
	LProp_Computed = 3
LProp_Undecided = LProp_Status.LProp_Undecided
LProp_Undefined = LProp_Status.LProp_Undefined
LProp_Defined = LProp_Status.LProp_Defined
LProp_Computed = LProp_Status.LProp_Computed

class LProp_CIType(IntEnum):
	LProp_Inflection = 0
	LProp_MinCur = 1
	LProp_MaxCur = 2
LProp_Inflection = LProp_CIType.LProp_Inflection
LProp_MinCur = LProp_CIType.LProp_MinCur
LProp_MaxCur = LProp_CIType.LProp_MaxCur
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(LProp_SequenceOfCIType) NCollection_Sequence<LProp_CIType>;

%extend NCollection_Sequence<LProp_CIType> {
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence<LProp_CIType> LProp_SequenceOfCIType;
/* end typedefs declaration */

/*****************************
* class LProp_AnalyticCurInf *
*****************************/
class LProp_AnalyticCurInf {
	public:
		/****************** LProp_AnalyticCurInf ******************/
		%feature("compactdefaultargs") LProp_AnalyticCurInf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LProp_AnalyticCurInf;
		 LProp_AnalyticCurInf();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
T: GeomAbs_CurveType
UFirst: float
ULast: float
Result: LProp_CurAndInf

Returns
-------
None
") Perform;
		void Perform(const GeomAbs_CurveType T, const Standard_Real UFirst, const Standard_Real ULast, LProp_CurAndInf & Result);

};


%extend LProp_AnalyticCurInf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class LProp_CurAndInf *
************************/
class LProp_CurAndInf {
	public:
		/****************** LProp_CurAndInf ******************/
		%feature("compactdefaultargs") LProp_CurAndInf;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") LProp_CurAndInf;
		 LProp_CurAndInf();

		/****************** AddExtCur ******************/
		%feature("compactdefaultargs") AddExtCur;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float
IsMin: bool

Returns
-------
None
") AddExtCur;
		void AddExtCur(const Standard_Real Param, const Standard_Boolean IsMin);

		/****************** AddInflection ******************/
		%feature("compactdefaultargs") AddInflection;
		%feature("autodoc", "No available documentation.

Parameters
----------
Param: float

Returns
-------
None
") AddInflection;
		void AddInflection(const Standard_Real Param);

		/****************** Clear ******************/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") Clear;
		void Clear();

		/****************** IsEmpty ******************/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") IsEmpty;
		Standard_Boolean IsEmpty();

		/****************** NbPoints ******************/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Returns the number of points. the points are stored to increasing parameter.

Returns
-------
int
") NbPoints;
		Standard_Integer NbPoints();

		/****************** Parameter ******************/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Returns the parameter of the nth point. raises if n not in the range [1,nbpoints()].

Parameters
----------
N: int

Returns
-------
float
") Parameter;
		Standard_Real Parameter(const Standard_Integer N);

		/****************** Type ******************/
		%feature("compactdefaultargs") Type;
		%feature("autodoc", "Returns - mincur if the nth parameter corresponds to a minimum of the radius of curvature. - maxcur if the nth parameter corresponds to a maximum of the radius of curvature. - inflection if the parameter corresponds to a point of inflection. raises if n not in the range [1,nbpoints()].

Parameters
----------
N: int

Returns
-------
LProp_CIType
") Type;
		LProp_CIType Type(const Standard_Integer N);

};


%extend LProp_CurAndInf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
