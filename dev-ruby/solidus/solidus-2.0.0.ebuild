# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Solidus is an open source e-commerce framework for Ruby on Rails"
HOMEPAGE="http://solidus.io"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend "=dev-ruby/solidus_core-2.0.0"
ruby_add_rdepend "=dev-ruby/solidus_api-2.0.0"
ruby_add_rdepend "=dev-ruby/solidus_backend-2.0.0"
ruby_add_rdepend "=dev-ruby/solidus_frontend-2.0.0"
ruby_add_rdepend "=dev-ruby/solidus_sample-2.0.0"

