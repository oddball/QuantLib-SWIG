=begin
 Copyright (C) 2000, 2001, 2002 RiskMap srl

 This file is part of QuantLib, a free-software/open-source library
 for financial quantitative analysts and developers - http://quantlib.org/

 QuantLib is free software: you can redistribute it and/or modify it under the
 terms of the QuantLib license.  You should have received a copy of the
 license along with this program; if not, please email ferdinando@ametrano.net
 The license is also available online at http://quantlib.org/html/license.html

 This program is distributed in the hope that it will be useful, but WITHOUT
 ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 FOR A PARTICULAR PURPOSE.  See the license for more details.
=end

# $Id$

require 'runit/testcase'
require 'runit/testsuite'
require 'runit/cui/testrunner'

require 'covariance'
require 'dates'
require 'daycounters'
require 'distributions'
require 'europeanoption'
require 'instruments'
require 'marketelements'
require 'operators'
require 'piecewiseflatforward'
require 'riskstatistics'
require 'segmentintegral'
require 'simpleswap'
require 'solvers1d'
require 'statistics'
require 'termstructures'

suite = RUNIT::TestSuite.new
suite.add_test(CovarianceTest.suite)
suite.add_test(DateTest.suite)
suite.add_test(DayCounterTest.suite)
suite.add_test(DistributionTest.suite)
suite.add_test(EuropeanOptionTest.suite)
suite.add_test(InstrumentTest.suite)
suite.add_test(MarketElementTest.suite)
suite.add_test(MarketElementHandleTest.suite)
suite.add_test(OperatorTest.suite)
suite.add_test(PiecewiseFlatForwardTest.suite)
suite.add_test(RiskStatisticsTest.suite)
suite.add_test(SegmentIntegralTest.suite)
suite.add_test(SimpleSwapTest.suite)
suite.add_test(Solver1DTest.suite)
suite.add_test(StatisticsTest.suite)
suite.add_test(TermStructureTest.suite)

module RUNIT
  module CUI
    class TestRunner
      def add_failure(at, err)
        @io.print("failed")
      end
      def add_error(at, err)
        @io.print("error")
      end
      def end_test(t)
        @io.print("ok")
      end
    end
  end
end

result = RUNIT::CUI::TestRunner.run(suite)
unless result.succeed?
  exit(1)
end


