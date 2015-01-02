# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Code metrics from Flog, Flay, Saikuro, Churn, Reek, Roodi, Code Statistics, and Rails Best Practices"
HOMEPAGE="https://github.com/metricfu/metric_fu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/flay-2.1"
ruby_add_rdepend ">=dev-ruby/churn-0.0.35"
ruby_add_rdepend ">=dev-ruby/flog-4.1"
ruby_add_rdepend ">=dev-ruby/reek-1.3"
ruby_add_rdepend ">=dev-ruby/cane-2.5"
ruby_add_rdepend ">=dev-ruby/rails_best_practices-1.14"
ruby_add_rdepend ">=dev-ruby/metric_fu-Saikuro-1.1"
ruby_add_rdepend ">=dev-ruby/roodi-3.1"
ruby_add_rdepend ">=dev-ruby/code_metrics-0.1"
ruby_add_rdepend ">=dev-ruby/redcard-0"
ruby_add_rdepend ">=dev-ruby/coderay-0"
ruby_add_rdepend ">=dev-ruby/multi_json-0"
ruby_add_rdepend ">=dev-ruby/launchy-2.0"
ruby_add_rdepend ">=dev-ruby/test_construct-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

