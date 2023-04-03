# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Toolkit for turning OpeNER components into daemons"
HOMEPAGE="http://opener-project.github.io"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/aws-sdk-2.0"
ruby_add_rdepend ">=dev-ruby/slop-3.0"
ruby_add_rdepend ">=dev-ruby/opener-callback-handler-1.1"
ruby_add_rdepend ">=dev-ruby/opener-core-2.3"
ruby_add_rdepend ">=dev-ruby/newrelic_rpm-0"
ruby_add_rdepend ">=dev-ruby/json-schema-0"
ruby_add_rdepend ">=dev-ruby/rollbar-1.0"
ruby_add_rdepend ">=dev-ruby/oni-4.0"
ruby_add_rdepend ">=dev-ruby/oga-1.0"
ruby_add_rdepend ">=dev-ruby/httpclient-2.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"

