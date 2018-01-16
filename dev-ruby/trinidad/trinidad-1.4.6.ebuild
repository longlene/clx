# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Trinidad allows you to run Rails or Rack applications within an embedded Apache Tomcat container"
HOMEPAGE="https://github.com/trinidad/trinidad"

LICENSE="MIT Apache-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/trinidad_jars-1.3.0"
ruby_add_rdepend ">=dev-ruby/jruby-rack-1.1.13"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.1"
ruby_add_rdepend ">=dev-ruby/mocha-0.12.1"
ruby_add_rdepend ">=dev-ruby/fakefs-0.4.0"

