# Copyright (c) Stanford University, The Regents of the University of
#               California, and others.
#
# All Rights Reserved.
#
# See Copyright-SimVascular.txt for additional details.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

ITK_MAJOR_VERSION=4
ITK_MINOR_VERSION=13
ITK_PATCH_VERSION=2
ITK_VERSION=$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION).$(ITK_PATCH_VERSION)

ITK_BIN_DIR = $(OPEN_SOFTWARE_BINARIES_TOPLEVEL)/itk-$(ITK_VERSION)
#    ITK_DEFS = -D ITK_IO_FACTORY_REGISTER_MANAGER -D MSVC
ITK_DEFS = -D MSVC
ITK_INCLUDE_DIR_BASE = $(ITK_BIN_DIR)/include/ITK-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)
ITK_LIBDIRS = $(ITK_BIN_DIR)/lib
ITK_BIN_LIBS = $(ITK_BIN_DIR)/bin

ITK_INCDIRS = \
      -I$(ITK_INCLUDE_DIR_BASE) \
      -I$(ITK_INCLUDE_DIR_BASE)/itkfdstream \
      -I$(ITK_INCLUDE_DIR_BASE)/itkjpeg \
      -I$(ITK_INCLUDE_DIR_BASE)/itkpng \
      -I$(ITK_INCLUDE_DIR_BASE)/itkzlib \
      -I$(ITK_INCLUDE_DIR_BASE)/vnl

ITK_LIBS =    $(LIBPATH_COMPILER_FLAG)$(ITK_LIBDIRS) \
$(LIBFLAG)ITKBiasCorrection-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOJPEG-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKOptimizers-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKBioCell-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOLSM-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKPath-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKCommon-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOMesh-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkpng-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKDICOMParser-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOMeta-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKPolynomials-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkdouble-conversion-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOMRC-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKQuadEdgeMesh-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKEXPAT-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIONIFTI-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKTransform-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKTransformFactory-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKSpatialObjects-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKFEM-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIONRRD-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKStatistics-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOPNG-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itksys-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOSiemens-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOSpatialObjects-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOStimulate-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOTIFF-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itktiff-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOTransformBase-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOTransformHDF5-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkv3p_netlib-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOTransformInsightLegacy-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkvcl-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKgiftiio-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOTransformMatlab-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKVideoCore-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOVTK-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKVideoIO-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOXML-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkvnl_algo-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOBioRad-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkjpeg-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkvnl-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOBMP-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKKLMRegionGrowing-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKVNLInstantiation-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOCSV-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKLabelMap-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKVTK-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOGDCM-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKMesh-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKVtkGlue-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOGE-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKMetaIO-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKWatersheds-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOGIPL-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkNetlibSlatec-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkzlib-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOHDF5-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKniftiio-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKznz-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOImageBase-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKNrrdIO-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)ITKIOIPL-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT) \
$(LIBFLAG)itkopenjpeg-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)

# only needed if you are using itk gdcm
#

#$(LIBFLAG)itkgdcmCommon-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmDICT-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmDSED-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmIOD-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmjpeg12-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmjpeg16-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmjpeg8-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)
#$(LIBFLAG)itkgdcmMSFF-$(ITK_MAJOR_VERSION).$(ITK_MINOR_VERSION)$(LIBLINKEXT)

#-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/DataStructureAndEncodingDefinition \
-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/MessageExchangeDefinition \
-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/InformationObjectDefinition \
-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/DataDictionary \
-I$(ITK_SRC_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/MediaStorageAndFileFormat \
-I$(ITK_BIN_DIR)/Modules/ThirdParty/GDCM/src/gdcm/Source/Common \
-I$(ITK_BIN_DIR)/Modules/ThirdParty/GDCM \