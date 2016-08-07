# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Hanami is a web framework for Ruby"
HOMEPAGE="http://hanamirb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hanami-utils-0.8"
ruby_add_rdepend ">=dev-ruby/hanami-validations-0.6"
ruby_add_rdepend ">=dev-ruby/hanami-router-0.7"
ruby_add_rdepend ">=dev-ruby/hanami-controller-0.7"
ruby_add_rdepend ">=dev-ruby/hanami-view-0.7"
ruby_add_rdepend ">=dev-ruby/hanami-helpers-0.4"
ruby_add_rdepend ">=dev-ruby/hanami-mailer-0.3"
ruby_add_rdepend ">=dev-ruby/hanami-assets-0.3"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/minispec-metadata-3.2.1"
ruby_add_rdepend ">=dev-ruby/minitest-5"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rake-10"

